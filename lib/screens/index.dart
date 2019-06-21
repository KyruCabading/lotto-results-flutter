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
      // AppPage(
      //   title: 'My Tickets',
      //   icon: Icons.receipt,
      //   color: Colors.blueAccent.shade400,
      //   body: ResultsScreen(),
      // ),
      AppPage(
        title: "Results",
        icon: Icons.today,
        color: Colors.red,
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
        body: PlaceholderScreen(Colors.grey),
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
