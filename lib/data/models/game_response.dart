import 'package:equatable/equatable.dart';
import 'package:now_playing/data/models/game_model.dart';

class GameResponse extends Equatable {
  final List<GameModel> gameList;

  const GameResponse({required this.gameList});

  factory GameResponse.fromJson(Map<String, dynamic> json) => GameResponse(
      gameList: List<GameModel>.from((json['results'] as List)
          .map((e) => GameModel.fromJson(e))
      )
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(gameList.map((e) => e.toJson()))
  };

  @override
  // TODO: implement props
  List<Object?> get props => [gameList];
}