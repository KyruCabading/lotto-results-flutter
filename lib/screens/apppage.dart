import 'package:flutter/material.dart';

class AppPage {
  AppPage(
      {IconData icon,
      String title,
      Color color,
      this.body,
      TickerProvider vsync})
      : this._icon = icon,
        this.title = title,
        this._color = color,
        this.item = new BottomNavigationBarItem(
          icon: Icon(icon),
          title: new Text(
            title,
          ),
        );

  final IconData _icon;
  final String title;
  final Color _color;
  final BottomNavigationBarItem item;
  final Widget body;
}
