import 'package:flutter/material.dart';
import 'package:now_playing/common/constants.dart';
import 'package:now_playing/common/utils.dart';
import 'package:now_playing/di/injection.dart' as di;
import 'package:now_playing/presentation/pages/game_detail_page.dart';
import 'package:now_playing/presentation/pages/home_page.dart';
import 'package:now_playing/presentation/provider/game_detail_notifiers.dart';
import 'package:now_playing/presentation/provider/game_list_notifiers.dart';
import 'package:provider/provider.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => di.locator<GameListNotifier>(),
        ),
        ChangeNotifierProvider(
          create: (_) => di.locator<GameDetailNotifiers>(),
        ),
      ],
      child: MaterialApp(
        title: 'Now Playing',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: const HomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => const HomePage());
            case GameDetailPage.ROUTE_NAME:
              final id = settings.arguments as String;
              return MaterialPageRoute(builder: (_) => GameDetailPage(id: id));
            default:
              return MaterialPageRoute(
                builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
