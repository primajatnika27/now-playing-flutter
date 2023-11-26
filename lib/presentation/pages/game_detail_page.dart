import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_any_logo/flutter_logo.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:now_playing/common/constants.dart';
import 'package:now_playing/common/date_formatter.dart';
import 'package:now_playing/common/state_enum.dart';
import 'package:now_playing/data/models/game_details_model.dart';
import 'package:now_playing/domain/entities/game_detail.dart';
import 'package:now_playing/presentation/provider/game_detail_notifiers.dart';
import 'package:provider/provider.dart';

class GameDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail';

  final String id;
  const GameDetailPage({super.key, required this.id});

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<GameDetailNotifiers>(context, listen: false)
          .fetchDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GameDetailNotifiers>(
        builder: (context, provider, child) {
          if (provider.state == RequestState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == RequestState.loaded) {
            final detail = provider.gameDetail;
            return SafeArea(
              child: DetailGameContent(
                detail: detail,
              ),
            );
          } else {
            return Center(
              child: Text(provider.message),
            );
          }
        },
      ),
    );
  }
}

class DetailGameContent extends StatelessWidget {
  final GameDetail detail;

  const DetailGameContent({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '${detail.backgroundImage}',
          width: screenWidth,
          height: 500,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            minChildSize: 0.4,
            initialChildSize: 0.6,
            maxChildSize: 1,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kGrey,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 3),
                                      child: Text(
                                        dateReleaseFormatter(detail.released),
                                        style:
                                            kBodyText.copyWith(color: kBgBlack),
                                      ),
                                    ),
                                  ),
                                  detail.platforms!.isNotEmpty
                                      ? RowOfPlatform(
                                          platforms: detail.platforms!)
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                            Center(
                              child: Text(
                                detail.name ?? '',
                                textAlign: TextAlign.center,
                                style: kHeading5.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'AVERAGE PLAY TIME : ${detail.playtime} HOURS',
                                style: kHeading6.copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    letterSpacing: 1.4),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'About',
                                    style: kHeading5.copyWith(
                                      fontSize: 17,
                                    ),
                                  ),
                                  Html(data: detail.description),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }
}

class RowOfPlatform extends StatelessWidget {
  final List<PlatformElement> platforms;

  const RowOfPlatform({super.key, required this.platforms});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
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
                  height: 30,
                  width: 30,
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
            child: AnyLogo.tech.google.image(
                height: 25,
                width: 25,
                fit: BoxFit.contain,
                color: Colors.white),
          );
        }).toList(),
      ),
    );
  }
}
