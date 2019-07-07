import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LottoResult {
  const LottoResult({
    @required this.name,
    @required this.date,
    @required this.jackpot,
    @required this.combination,
    @required this.winners,
  })  : assert(name != null),
        assert(date != null),
        assert(jackpot != null),
        assert(combination != null),
        assert(winners != null);

  final String name;
  final DateTime date;
  final num jackpot;
  final List<String> combination;
  final int winners;

  Game get game => GameTypeMap[name];
  Color get color => GameColorMap[name];
  IconData get icon => GameIconMap[name];
  String get logoImage => GameLogoMap[name];
  int get priority => GamePriorityMap[name];

  factory LottoResult.fromJson(DocumentSnapshot parsedJson) {
    return LottoResult(
      name: parsedJson['name'],
      date: new DateTime.fromMillisecondsSinceEpoch(
          int.parse(parsedJson['date'])),
      jackpot: parsedJson['jackpot'],
      combination: parsedJson['combination'].toString().split("-"),
      winners: parsedJson['winners'],
    );
  }
}

const GameTypeMap = {
  '4Digit': Game.digit4,
  '6Digit': Game.digit6,
  'Suertres Lotto 11AM': Game.suertres,
  'Suertres Lotto 4PM': Game.suertres,
  'Suertres Lotto 9PM': Game.suertres,
  'EZ2 Lotto 11AM': Game.ez2,
  'EZ2 Lotto 4PM': Game.ez2,
  'EZ2 Lotto 9PM': Game.ez2,
  'Lotto 6/42': Game.lotto642,
  'Superlotto 6/49': Game.super649,
  'Megalotto 6/45': Game.mega645,
  'Grand Lotto 6/55': Game.grand655,
  'Ultra Lotto 6/58': Game.ultra658,
};

const GameColorMap = {
  '4Digit': Colors.deepOrange,
  '6Digit': Colors.deepOrange,
  'Suertres Lotto 11AM': Colors.blue,
  'Suertres Lotto 4PM': Colors.blue,
  'Suertres Lotto 9PM': Colors.blue,
  'EZ2 Lotto 11AM': Colors.green,
  'EZ2 Lotto 4PM': Colors.green,
  'EZ2 Lotto 9PM': Colors.green,
  'Lotto 6/42': Colors.red,
  'Superlotto 6/49': Colors.red,
  'Megalotto 6/45': Colors.red,
  'Grand Lotto 6/55': Colors.red,
  'Ultra Lotto 6/58': Colors.purple,
};

const GameIconMap = {
  '4Digit': null,
  '6Digit': null,
  'Suertres Lotto 11AM': Icons.wb_sunny,
  'Suertres Lotto 4PM': null,
  'Suertres Lotto 9PM': Icons.brightness_3,
  'EZ2 Lotto 11AM': Icons.wb_sunny,
  'EZ2 Lotto 4PM': null,
  'EZ2 Lotto 9PM': Icons.brightness_3,
  'Lotto 6/42': null,
  'Superlotto 6/49': null,
  'Megalotto 6/45': null,
  'Grand Lotto 6/55': null,
  'Ultra Lotto 6/58': null,
};

const GameLogoMap = {
  '4Digit': null,
  '6Digit': null,
  'Suertres Lotto 11AM': null,
  'Suertres Lotto 4PM': null,
  'Suertres Lotto 9PM': null,
  'EZ2 Lotto 11AM': null,
  'EZ2 Lotto 4PM': null,
  'EZ2 Lotto 9PM': null,
  'Lotto 6/42': null,
  'Superlotto 6/49': null,
  'Megalotto 6/45': 'assets/images/mega-645.png',
  'Grand Lotto 6/55': null,
  'Ultra Lotto 6/58': 'assets/images/ultra-658.png',
};

const GamePriorityMap = {
  '4Digit': 7,
  '6Digit': 6,
  'Suertres Lotto 11AM': 10,
  'Suertres Lotto 4PM': 9,
  'Suertres Lotto 9PM': 8,
  'EZ2 Lotto 11AM': 13,
  'EZ2 Lotto 4PM': 12,
  'EZ2 Lotto 9PM': 11,
  'Lotto 6/42': 5,
  'Superlotto 6/49': 4,
  'Megalotto 6/45': 3,
  'Grand Lotto 6/55': 2,
  'Ultra Lotto 6/58': 1,
};

enum Game {
  all, // All Games
  digit4, // 4 Digit
  digit6, // 6 Digit
  suertres, // Suertres Lotto 11AM
  ez2, // EZ2 Lotto
  lotto642, // Lotto 6/42
  super649, // Super Lotto 6/49
  mega645, // Mega Lotto 6/45
  grand655, // Grand Lotto 6/55
  ultra658, // Ultra Lotto 6/58
}
