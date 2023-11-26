import 'package:equatable/equatable.dart';
import 'package:now_playing/data/models/game_details_model.dart';

class GameDetailsResponse extends Equatable {
  final GameDetailsModel gameDetails;

  const GameDetailsResponse({required this.gameDetails});

  factory GameDetailsResponse.fromJson(Map<String, dynamic> json) => GameDetailsResponse(
      gameDetails: GameDetailsModel.fromJson(json)
  );

  @override
  List<Object?> get props => throw UnimplementedError();

}