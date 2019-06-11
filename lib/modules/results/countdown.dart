import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lotto/styles.dart';

class CountDownTimer extends StatelessWidget {
  final _now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final schedule = DateTime(_now.year, _now.month, _now.day, 22, 00);

    return StreamBuilder(
        stream: Stream.periodic(Duration(seconds: 1), (i) => i),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          final targetTime = DateTime.now().isAfter(schedule)
              ? schedule.add(Duration(days: 1))
              : schedule;

          DateFormat format = DateFormat("mm:ss");
          int _now = DateTime.now().millisecondsSinceEpoch;
          Duration remaining =
              Duration(milliseconds: targetTime.millisecondsSinceEpoch - _now);
          var dateString =
              '${remaining.inHours}:${format.format(DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))}';
          return Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Time till next results'.toUpperCase(),
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
