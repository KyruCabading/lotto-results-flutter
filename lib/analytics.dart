import 'package:lotto/model/lottoresult.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

void analyticsSetCurrentScreen(String screenName) {
  FirebaseAnalytics().setCurrentScreen(screenName: screenName);
}

// Results
void analyticsResultsFiltered(Game game) async {
  await FirebaseAnalytics().logEvent(
    name: 'results_filtered',
    parameters: <String, dynamic>{
      'game': game.toString(),
    },
  );
}

void analyticsResultsRefreshed() async {
  await FirebaseAnalytics().logEvent(
    name: 'results_refreshed',
  );
}

// Playlist
void analyticsVideoSelected() async {
  await FirebaseAnalytics().logEvent(name: 'video_selected');
}
