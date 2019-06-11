import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lotto/styles.dart';

class CountDownTimer extends StatelessWidget {
  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final todayAt12 = DateTime(now.year, now.month, now.day, 23, 30);
    final isPastTargetTime = now.isAfter(todayAt12);
    final targetTime =
        isPastTargetTime ? todayAt12.add(Duration(days: 1)) : todayAt12;

    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          DateFormat format = DateFormat("mm:ss");
          int now = DateTime.now().millisecondsSinceEpoch;
          Duration remaining =
              Duration(milliseconds: targetTime.millisecondsSinceEpoch - now);
          var dateString =
              '${remaining.inHours}:${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'time till next update'.toUpperCase(),
                  style: Styles.countdownSubtitle,
                ),
                Text(
                  dateString,
                  style: Styles.countdownTitle,
                ),
              ],
            ),
          );
        });
  }
}
