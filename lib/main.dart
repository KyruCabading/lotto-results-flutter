import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'screens/index.dart';
import 'model/app_state_model.dart';

void main() {
  return runApp(ChangeNotifierProvider<AppStateModel>(
    builder: (context) => AppStateModel()..loadResults(),
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));

    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primaryColor: Colors.grey[100],
        accentColor: const Color(0xFF0038a8),
      ),
      home: Index(),
    );
  }
}
