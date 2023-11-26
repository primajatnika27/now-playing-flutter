import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:now_playing/common/constants.dart';
import 'package:now_playing/common/date_formatter.dart';
import 'package:now_playing/common/state_enum.dart';
import 'package:now_playing/data/models/game_model.dart';
import 'package:now_playing/domain/entities/game.dart';
import 'package:now_playing/presentation/pages/game_detail_page.dart';
import 'package:now_playing/presentation/provider/game_list_notifiers.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> platform = [
    'PC',
    'Playstation 5',
    'Xbox',
    'iOS',
    'Android'
  ];

  List<CoolDropdownItem<String>> platformDropdownItems = [];
  final platformDropdownController = DropdownController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<GameListNotifier>(context, listen: false)..fetchGames());

    for (var i = 0; i < platform.length; i++) {
      platformDropdownItems.add(
        CoolDropdownItem<String>(
            label: platform[i],
            icon: const SizedBox(
              height: 25,
              width: 25
            ),
            value: platform[i]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RAWG'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 150, bottom: 20),
              child: CoolDropdown<String>(
                controller: platformDropdownController,
                dropdownList: platformDropdownItems,
                defaultItem: null,
                onChange: (value) async {
                  if (platformDropdownController.isError) {
                    await platformDropdownController.resetError();
                  }
                },
                onOpen: (value) {},
                resultOptions: const ResultOptions(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: 100,
                  icon: SizedBox(
                    width: 10,
                    height: 10,
                    child: CustomPaint(
                      painter: DropdownArrowPainter(),
                    ),
                  ),
                  render: ResultRender.all,

                  placeholder: 'Select Platform',
                ),
                dropdownOptions: const DropdownOptions(
                    top: 20,
                    height: 200,
                    gap: DropdownGap.all(5),
                    borderSide: BorderSide(width: 1, color: Colors.black),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    align: DropdownAlign.left,
                    animationType: DropdownAnimationType.size),
                dropdownTriangleOptions: const DropdownTriangleOptions(
                  width: 20,
                  height: 30,
                  align: DropdownTriangleAlign.left,
                  borderRadius: 3,
                  left: 20,
                ),
                dropdownItemOptions: const DropdownItemOptions(
                  isMarquee: true,
                  mainAxisAlignment: MainAxisAlignment.start,
                  render: DropdownItemRender.all,
                  height: 50,
                ),
              ),
            ),
          ),
          Consumer<GameListNotifier>(builder: (context, data, child) {
            final state = data.state;

            if (state == RequestState.loading) {
              return const SliverToBoxAdapter(
                child: SizedBox(
                  height: 150,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            } else if (state == RequestState.loaded) {
              return GameList(data.gameList);
            } else {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text('Failed'),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}

class GameList extends StatelessWidget {
  final List<Game> games;

  const GameList(this.games, {super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        var game = games[index];
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              GameDetailPage.ROUTE_NAME,
              arguments: game.id.toString(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                color: kBgBlack,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: game.backgroundImage ?? '',
                      placeholder: (context, url) => Shimmer.fromColors(
                        enabled: true,
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 150,
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Row(
                    children: [
                      game.platforms!.isNotEmpty
                          ? RowOfPlatform(platforms: game.platforms!)
                          : const SizedBox(),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.greenAccent),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text('${game.metacritic}',
                              style: kBodyText.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent,
                              )),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    child: Text(
                      game.name ?? '',
                      style: kHeading6.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children:  [
                            const Text('Release Date :'),
                            const Spacer(),
                            Text(dateReleaseFormatter(game.released!))
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            color: kDavysGrey,
                            height: 1,
                          ),
                        ),
                        Row(
                          children: game.genres!.map((e) => Chip(
                            label: Text(e.name!),
                          )).toList(),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }, childCount: games.length),
    );
  }
}

class RowOfPlatform extends StatelessWidget {
  final List<PlatformElement> platforms;

  const RowOfPlatform({super.key, required this.platforms});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        children: platforms.map((e) {
          if (e.platform!.name!.contains('Android')) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: AnyLogo.tech.android.image(
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                  color: Colors.white),
            );
          } else if (e.platform!.name!.contains('PC')) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: AnyLogo.tech.microsoft.image(
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                  color: Colors.white),
            );
          } else if (e.platform!.name!.contains('PlayStation 5')) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: AnyLogo.tech.playstation.image(
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                  color: Colors.white),
            );
          } else if (e.platform!.name!.contains('macOS')) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: AnyLogo.tech.apple.image(
                  height: 15,
                  width: 15,
                  fit: BoxFit.contain,
                  color: Colors.white),
            );
          } else if (e.platform!.name!.contains('Xbox') ||
              e.platform!.name!.contains('Xbox Series S/X')) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: AnyLogo.tech.xbox.image(
                  height: 25,
                  width: 25,
                  fit: BoxFit.contain,
                  color: Colors.white),
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: AnyLogo.tech.apple.image(
                height: 15,
                width: 15,
                fit: BoxFit.contain,
                color: Colors.white),
          );
        }).toList(),
      ),
    );
  }
}
