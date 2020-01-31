import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'screens/index.dart';
import 'model/app_state_model.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  return runApp(ChangeNotifierProvider<AppStateModel>(
    builder: (context) => AppStateModel()..loadData(),
    child: App(),
  ));
}

class App extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: <NavigatorObserver>[observer],
      title: 'PCSO Lotto Results',
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        accentColor: const Color(0xFF0038a8),
      ),
      home: Index(),
    );
  }
}
