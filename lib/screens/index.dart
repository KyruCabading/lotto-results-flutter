import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

// Models
import 'package:lotto/model/app_state_model.dart';

// Screens
import 'apppage.dart';
import 'results.dart';
import 'playlist.dart';

class Index extends StatefulWidget {
  Index({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  State<StatefulWidget> createState() {
    return _IndexState(analytics, observer);
  }
}

class _IndexState extends State<Index> {
  _IndexState(this.analytics, this.observer);

  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  int _currentIndex = 0;
  List<AppPage> _items;

  @override
  void initState() {
    super.initState();

    // Notifications
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      _handleNotification(message);
    }, onLaunch: (Map<String, dynamic> message) async {
      // Do nothing on launch
    }, onResume: (Map<String, dynamic> message) async {
      _handleNotification(message);
    });

    _items = [
      // AppPage(
      //   title: 'My Tickets',
      //   icon: Icons.receipt,
      //   color: Colors.blueAccent.shade400,
      //   body: ResultsScreen(),
      // ),
      AppPage(
        title: "Results",
        icon: Icons.today,
        color: Colors.grey,
        body: ResultsScreen(),
      ),
      AppPage(
        title: "Watch",
        icon: Icons.live_tv,
        color: Colors.teal,
        body: PlaylistScreen(),
      ),
      // AppPage(
      //   title: "Settings",
      //   icon: Icons.settings,
      //   color: Colors.grey,
      //   body: PlaceholderScreen(Colors.grey.shade100),
      // ),
    ];
    _sendCurrentScreenToAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar _navBar = BottomNavigationBar(
      items: _items.map((page) {
        return page.item;
      }).toList(),
      currentIndex: _currentIndex,
      onTap: (int) {
        setState(() {
          _currentIndex = int;
        });
        _sendCurrentScreenToAnalytics();
      },
      selectedItemColor: Colors.grey.shade800,
      unselectedItemColor: Colors.grey.shade400,
    );

    final Widget _body = AnimatedSwitcher(
      duration: Duration(milliseconds: 150),
      child: Container(
        child: _items[_currentIndex].body,
        key: ValueKey<int>(_currentIndex),
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // body: ResultsScreen(),
      body: _body,
      bottomNavigationBar: _navBar,
    );
  }

  void _handleNotification(Map<String, dynamic> notification) {
    if (notification.containsKey('notification')) {
      Provider.of<AppStateModel>(context).loadResults();
    }
  }

  void _sendCurrentScreenToAnalytics() async {
    final _screenName = _items[_currentIndex].title;
    observer.analytics.setCurrentScreen(screenName: _screenName);
  }
}
