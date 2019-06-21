import 'package:flutter/material.dart';
import './apppage.dart';
import 'placeholder.dart';
import 'results.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

class _IndexState extends State<Index> with TickerProviderStateMixin {
  int _currentIndex = 1;
  List<AppPage> _items;

  @override
  void initState() {
    super.initState();

    _items = [
      AppPage(
        title: 'My Tickets',
        icon: Icon(Icons.receipt),
        color: Colors.blueAccent.shade400,
        body: ResultsScreen(),
        vsync: this,
      ),
      AppPage(
        title: "Results",
        icon: Icon(Icons.today),
        color: Colors.red,
        body: ResultsScreen(),
        vsync: this,
      ),
      AppPage(
        title: "Lucky Pick",
        icon: Icon(Icons.person),
        color: Colors.teal,
        body: ResultsScreen(),
        vsync: this,
      ),
      AppPage(
        title: "Profile",
        icon: Icon(Icons.person),
        color: Colors.blueAccent.shade400,
        body: ResultsScreen(),
        vsync: this,
      ),
    ];
  }

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

  Widget _buildPageStack() {
    final List<Widget> transitions = <Widget>[];

    for (int i = 0; i < _items.length; i++) {
      transitions.add(IgnorePointer(
          ignoring: _currentIndex != i,
          child: _items[i].buildTransition(context)));
    }
    return new Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar navBar = BottomNavigationBar(
      items: _items.map((page) {
        return page.item;
      }).toList(),
      currentIndex: _currentIndex,
      onTap: (int) {
        setState(() {
          _currentIndex = int;
        });
      },
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedSwitcher(
        duration: duration,
        child: Container(
          child: _contents[_currentIndex],
          key: ValueKey<int>(_currentIndex),
        ),
      ),
      bottomNavigationBar: navBar,
    );
  }
}
