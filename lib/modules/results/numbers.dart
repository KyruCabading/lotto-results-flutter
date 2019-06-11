import 'package:flutter/material.dart';
import 'package:lotto/styles.dart';

class NumberBall extends StatelessWidget {
  const NumberBall({this.numberValue, this.color});

  final String numberValue;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        // backgroundColor: color.withAlpha(50),
        maxRadius: 18,
        child: Text(
          '$numberValue',
          // style: Styles.numberBallTitle,
          style: Styles.numberBallTitle.apply(color: color),
        ),
      ),
    );
  }
}

class NumberBalls extends StatelessWidget {
  const NumberBalls({this.numberValues, this.color});

  final List<String> numberValues;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final List<NumberBall> numberBalls = numberValues
        .map((n) => NumberBall(numberValue: n, color: color))
        .toList();

    return Row(
      children: numberBalls,
    );
  }
}
