import 'package:now_playing/common/failure.dart';
import 'package:now_playing/domain/entities/game.dart';
import 'package:now_playing/domain/repositories/game_repository.dart';
import 'package:dartz/dartz.dart';

class GetGames {
  final GameRepository repository;

  GetGames(this.repository);

  Future<Either<Failure, List<Game>>> execute() {
    return repository.getGames();
  }
}