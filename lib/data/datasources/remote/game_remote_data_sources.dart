import 'package:dio/dio.dart';
import 'package:now_playing/common/constants.dart';
import 'package:now_playing/common/exceptions.dart';
import 'package:now_playing/data/models/game_details_model.dart';
import 'package:now_playing/data/models/game_model.dart';
import 'package:now_playing/data/models/game_response.dart';

abstract class GameRemoteDataSources {
  Future<List<GameModel>> getGames();
  Future<GameDetailsModel> getGameDetails(String id);
}

class GameRemoteDataSourcesImpl implements GameRemoteDataSources {

  final dio = Dio();

  @override
  Future<List<GameModel>> getGames() async {
    final response = await dio.get(
        '$BASE_URL/games',
        queryParameters: {
          'key': API_KEY,
          'dates': '2023-01-01,2023-12-31'
        });

    if (response.statusCode == 200) {
      return GameResponse.fromJson(response.data).gameList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GameDetailsModel> getGameDetails(String id) async {
    final response = await dio.get(
      '$BASE_URL/games/$id',
        queryParameters: {
          'key': API_KEY,
        });

    if (response.statusCode == 200) {
      return GameDetailsModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}