import 'package:flutter/foundation.dart' as foundation;
import 'lottoresult.dart';
import 'lottoresult_repository.dart';
import 'package:lotto/repository/playlist_respository.dart';

class AppStateModel extends foundation.ChangeNotifier {
  List<LottoResult> _lottoResults;
  List _videoList;
  Game _selectedGame = Game.all;

  Future<void> loadData() async {
    loadResults();
    loadVideos();
  }

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

  // Playlist
  Future<void> loadVideos() async {
    _videoList = await PlaylistRepository.loadVideos();
    notifyListeners();
  }

  List getVideos() {
    if (_videoList == null) {
      return [];
    }
    return _videoList;
  }
}
