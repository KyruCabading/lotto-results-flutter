import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  final Color color;

  PlaceholderScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
