import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lotto/styles.dart';

class ResultsListSideheader extends StatelessWidget {
  const ResultsListSideheader({this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    var weekday = new DateFormat('E').format(date);
    var month = new DateFormat('MMM').format(date);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: <Widget>[
            Text('$month'.toUpperCase(),
                textAlign: TextAlign.center, style: Styles.dateHeaderMonth),
            Text('${date.day}',
                textAlign: TextAlign.center, style: Styles.dateHeaderDay),
            Text('$weekday'.toUpperCase(),
                textAlign: TextAlign.center, style: Styles.dateHeaderWeekday),
          ],
        ),
      ),
    );
  }
}
