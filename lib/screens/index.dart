import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import './apppage.dart';
import 'placeholder.dart';
import 'results.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  int _currentIndex = 0;
  List<AppPage> _items;

  @override
  void initState() {
    super.initState();

    // // Notifications
    // _firebaseMessaging.configure(
    //     onMessage: (Map<String, dynamic> message) async {
    //   _handleNotification(message);
    // }, onLaunch: (Map<String, dynamic> message) async {
    //   // Do nothing on launch
    // }, onResume: (Map<String, dynamic> message) async {
    //   _handleNotification(message);
    // });

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
      // AppPage(
      //   title: "Lucky Pick",
      //   icon: Icons.person,
      //   color: Colors.teal,
      //   body: PlaceholderScreen(Colors.blue),
      // ),
      AppPage(
        title: "Settings",
        icon: Icons.settings,
        color: Colors.grey,
        body: PlaceholderScreen(Colors.grey.shade100),
      ),
    ];
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
      body: _body,
      bottomNavigationBar: _navBar,
    );
  }
}
