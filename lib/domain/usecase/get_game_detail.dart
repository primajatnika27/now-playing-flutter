import 'package:dartz/dartz.dart';
import 'package:now_playing/common/failure.dart';
import 'package:now_playing/domain/entities/game_detail.dart';
import 'package:now_playing/domain/repositories/game_repository.dart';

class GetGameDetail {
  final GameRepository repository;

  GetGameDetail(this.repository);

  Future<Either<Failure, GameDetail>> execute(String id) {
    return repository.getGameDetails(id);
  }
}