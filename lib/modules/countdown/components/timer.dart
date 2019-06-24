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
        List<String> remainingMinutesSeconds = format
            .format(
                DateTime.fromMillisecondsSinceEpoch(remaining.inMilliseconds))
            .split(":");

        String remainingMinutes = remainingMinutesSeconds[0];
        String remainingSeconds = remainingMinutesSeconds[1];

        // var dateString =
        //     '${remaining.inHours}:$remainingMinutes:$remainingSeconds';

        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'next results'.toUpperCase(),
                style: Styles.countdownSubtitle.copyWith(fontSize: 8),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 0,
                    color: Colors.indigo[900],
                    child: Container(
                      height: 40,
                      width: 35,
                      alignment: Alignment.center,
                      child: Text(
                        '${remaining.inHours}',
                        style: Styles.countdownTitle,
                      ),
                    ),
                  ),
                  Text(':', style: Styles.countdownTitle),
                  Card(
                    elevation: 0,
                    color: Colors.indigo[900],
                    child: Container(
                      height: 40,
                      width: 35,
                      alignment: Alignment.center,
                      child: Text(
                        '$remainingMinutes',
                        style: Styles.countdownTitle,
                      ),
                    ),
                  ),
                  Text(':', style: Styles.countdownTitle),
                  Card(
                    elevation: 0,
                    color: Colors.indigo[900],
                    child: Container(
                      height: 40,
                      width: 35,
                      alignment: Alignment.center,
                      child: Text(
                        '$remainingSeconds',
                        style: Styles.countdownTitle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
