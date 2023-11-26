

import 'package:flutter/material.dart';
import 'package:now_playing/common/state_enum.dart';
import 'package:now_playing/domain/entities/game_detail.dart';
import 'package:now_playing/domain/usecase/get_game_detail.dart';

class GameDetailNotifiers extends ChangeNotifier {
  var _gameDetail = const GameDetail();
  GameDetail get gameDetail => _gameDetail;

  RequestState _state = RequestState.initial;
  RequestState get state => _state;

  String _message = '';
  String get message => _message;

  GameDetailNotifiers({
    required this.getDetail
  });

  GetGameDetail getDetail;

  Future<void> fetchDetail(String id) async {
    _state = RequestState.loading;
    notifyListeners();

    final result = await getDetail.execute(id);
    result.fold(
            (failure) {
          _state = RequestState.error;
          _message = failure.message;
          notifyListeners();
        },
            (data) {
          _state = RequestState.loaded;
          _gameDetail = data;
          notifyListeners();
        }
    );
  }
}