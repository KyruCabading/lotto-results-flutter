import 'package:flutter/material.dart';
import 'placeholder.dart';
import 'results.dart';
import 'package:lotto/styles.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> {
  int _currentIndex = 1;
  final List<String> _titles = [
    "My Tickets",
    "Results",
    "Lucky Pick",
    "Profile"
  ];

  final List<Widget> _contents = [
    ResultsScreen(),
    ResultsScreen(),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.yellow),
  ];

  final Duration duration = Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // appBar: AppBar(
      //   // backgroundColor: Colors.red,
      //   title: AnimatedSwitcher(
      //     duration: duration,
      //     child: Text('PCSO Lotto Results', style: Styles.appHeaderTitle),
      //     // child: Text(
      //     //   _titles[_currentIndex],
      //     //   key: ValueKey<int>(_currentIndex),
      //     // ),
      //   ),
      //   elevation: 8,
      //   // backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: AnimatedSwitcher(
        duration: duration,
        child: Container(
          child: _contents[_currentIndex],
          key: ValueKey<int>(_currentIndex),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 0,
      //   // backgroundColor: Colors.white,
      //   // unselectedItemColor: Theme.of(context).accentColor.withAlpha(100),
      //   // fixedColor: Theme.of(context).accentColor,
      //   onTap: onTabTapped,
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.receipt),
      //       title: Text(_titles[0]),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.today),
      //       title: Text(_titles[1]),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       title: Text(_titles[2]),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       title: Text(_titles[3]),
      //     )
      //   ],
      // ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
