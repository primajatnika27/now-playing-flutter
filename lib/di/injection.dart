import 'package:get_it/get_it.dart';
import 'package:now_playing/data/datasources/remote/game_remote_data_sources.dart';
import 'package:now_playing/data/repositories/game_repository_impl.dart';
import 'package:now_playing/domain/repositories/game_repository.dart';
import 'package:now_playing/domain/usecase/get_game_detail.dart';
import 'package:now_playing/domain/usecase/get_games.dart';
import 'package:now_playing/presentation/provider/game_detail_notifiers.dart';
import 'package:now_playing/presentation/provider/game_list_notifiers.dart';

final locator = GetIt.instance;

void init() {

  // state management
  locator.registerFactory(() => GameListNotifier(getGames: locator()));
  locator.registerFactory(() => GameDetailNotifiers(getDetail: locator()));

  // use case
  locator.registerLazySingleton(() => GetGames(locator()));
  locator.registerLazySingleton(() => GetGameDetail(locator()));

  // repository
  locator.registerLazySingleton<GameRepository>(
          () => GameRepositoryImpl(remoteDataSources: locator())
  );

  // data sources
  locator.registerLazySingleton<GameRemoteDataSources>(
          () => GameRemoteDataSourcesImpl()
  );
}