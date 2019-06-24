import 'package:flutter/material.dart';
import 'package:lotto/styles.dart';

class LottoNumber extends StatelessWidget {
  const LottoNumber({this.numberValue, this.color});

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

class LottoNumbers extends StatelessWidget {
  const LottoNumbers({this.numberValues, this.color});

  final List<String> numberValues;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final List<LottoNumber> numberBalls = numberValues
        .map((n) => LottoNumber(numberValue: n, color: color))
        .toList();

    return Row(
      children: numberBalls,
    );
  }
}
