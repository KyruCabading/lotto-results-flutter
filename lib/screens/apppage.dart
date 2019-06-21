import 'package:flutter/material.dart';

class AppPage {
  AppPage(
      {IconData icon,
      String title,
      Color color,
      this.body,
      TickerProvider vsync})
      : this._icon = icon,
        this._title = title,
        this._color = color,
        this.item = new BottomNavigationBarItem(
          icon: Icon(icon, color: color),
          title: new Text(
            title,
            style: TextStyle(color: color),
          ),
        );

  final IconData _icon;
  final String _title;
  final Color _color;
  final BottomNavigationBarItem item;
  final Widget body;
}
