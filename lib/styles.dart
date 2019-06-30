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
  // Header
  static const TextStyle countdownHeader = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 30,
    color: Colors.white,
    // shadows: [
    //   Shadow(
    //     offset: Offset(0.0, 2.0),
    //     blurRadius: 5.0,
    //     color: Color.fromARGB(255, 0, 0, 0),
    //   ),
    // ],
  );

  // Title
  static const TextStyle countdownTitle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    letterSpacing: 1,
    color: Colors.white,
    // shadows: [
    //   Shadow(
    //     offset: Offset(0.0, 2.0),
    //     blurRadius: 5.0,
    //     color: Color.fromARGB(255, 0, 0, 0),
    //   ),
    // ],
  );

  // Subtitle
  static const TextStyle countdownSubtitle = TextStyle(
    fontSize: 12,
    letterSpacing: 1,
    fontWeight: FontWeight.w100,
    color: Colors.white70,
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

  // [PLAYLIST]
  // Title
  static final TextStyle playlistTitle = TextStyle(fontSize: 18);
}
