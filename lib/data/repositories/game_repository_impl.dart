
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:now_playing/common/exceptions.dart';
import 'package:now_playing/common/failure.dart';
import 'package:now_playing/data/datasources/remote/game_remote_data_sources.dart';
import 'package:now_playing/domain/entities/game.dart';
import 'package:now_playing/domain/entities/game_detail.dart';
import 'package:now_playing/domain/repositories/game_repository.dart';

class GameRepositoryImpl extends GameRepository {
  final GameRemoteDataSources remoteDataSources;

  GameRepositoryImpl({
    required this.remoteDataSources
  });

  @override
  Future<Either<Failure, List<Game>>> getGames() async {
    try {
      final result = await remoteDataSources.getGames();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to server'));
    }
  }

  @override
  Future<Either<Failure, GameDetail>> getGameDetails(String id) async {
    try {
      final result = await remoteDataSources.getGameDetails(id);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to server'));
    }
  }
}