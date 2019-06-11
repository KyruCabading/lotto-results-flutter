import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  // [APP]
  static const TextStyle appHeaderTitle = TextStyle(
    fontSize: 34,
    letterSpacing: 1.5,
    fontWeight: FontWeight.w800,
  );

  // [COUNTDOWN]
  // Title
  static const TextStyle countdownTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 34,
    letterSpacing: 5,
  );

  // Subtitle
  static const TextStyle countdownSubtitle = TextStyle(
    fontSize: 10,
    letterSpacing: 1,
    fontWeight: FontWeight.w100,
    color: Colors.grey,
  );

  // [LOTTO RESULT CONTROLLER]
  // Title
  static const TextStyle lottoResultControllerTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  // [LOTTO RESULT]
  // Title
  static const TextStyle lottoResultTitle = TextStyle(
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
    fontSize: 17,
    color: Colors.white,
  );

  // Jackpot Value
  static const TextStyle lottoResultJackpot = TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.amberAccent,
    fontSize: 16,
  );

  // [NUMBER BALLS]
  // Title
  static const TextStyle numberBallTitle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  // [DATE HEADERS]
  // Month
  static final TextStyle dateHeaderMonth = TextStyle(
      // color: Colors.blueGrey[700],
      );
  // Day
  static final TextStyle dateHeaderDay = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    // color: Colors.blueGrey[700],
  );
  // Weekday
  static final TextStyle dateHeaderWeekday = TextStyle(
      // color: Colors.blueGrey[700],
      );
}
