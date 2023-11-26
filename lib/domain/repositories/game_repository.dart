import 'package:dartz/dartz.dart';
import 'package:now_playing/common/failure.dart';
import 'package:now_playing/domain/entities/game.dart';
import 'package:now_playing/domain/entities/game_detail.dart';

abstract class GameRepository {
  Future<Either<Failure, List<Game>>> getGames();
  Future<Either<Failure, GameDetail>> getGameDetails(String id);
}