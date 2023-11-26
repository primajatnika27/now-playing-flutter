import 'package:flutter/material.dart';
import 'package:now_playing/common/state_enum.dart';
import 'package:now_playing/domain/entities/game.dart';
import 'package:now_playing/domain/usecase/get_games.dart';

class GameListNotifier extends ChangeNotifier {
  var _gameList = <Game>[];
  List<Game> get gameList => _gameList;

  RequestState _state = RequestState.initial;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  GameListNotifier({
    required this.getGames
  });

  GetGames getGames;

  Future<void> fetchGames() async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getGames.execute();
    result.fold(
            (failure) {
              _state = RequestState.error;
              _message = failure.message;
              notifyListeners();
            },
            (data) {
              _state = RequestState.loaded;
              _gameList = data;
              notifyListeners();
            }
    );
  }
}