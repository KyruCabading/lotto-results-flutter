import 'package:flutter/foundation.dart' as foundation;

import 'lottoresult.dart';
import 'lottoresult_repository.dart';

class AppStateModel extends foundation.ChangeNotifier {
  List<LottoResult> _lottoResults;

  Game _selectedGame = Game.all;
  bool loadingLottoResults = true;

  Future<void> loadResults() async {
    _lottoResults = await LottoResultRepository.loadResults();
    notifyListeners();
  }

  List<LottoResult> getResults() {
    if (_lottoResults == null) {
      return [];
    }

    if (_selectedGame == Game.all) {
      return List.from(_lottoResults);
    } else {
      return _lottoResults.where((LottoResult result) {
        return result.game == _selectedGame;
      }).toList();
    }
  }

  void setSelectedGame(Game newGame) {
    _selectedGame = newGame;
    notifyListeners();
  }
}
