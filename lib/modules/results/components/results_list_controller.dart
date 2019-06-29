import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lotto/model/app_state_model.dart';
import 'package:lotto/model/lottoresult.dart';
import 'package:lotto/styles.dart';
import 'package:lotto/analytics.dart';

class ResultsListController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (context, model, child) {
      return SliverToBoxAdapter(
        child: Container(
          height: 100.0,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            scrollDirection: Axis.horizontal,
            children: gameButtons,
          ),
        ),
      );
    });
  }
}

const List<GameButton> gameButtons = [
  GameButton(
    name: 'All',
    game: Game.all,
    image: 'assets/images/pcso.png',
  ),
  GameButton(
    name: 'Ultra',
    game: Game.ultra658,
    image: 'assets/images/ultra-658.png',
  ),
  GameButton(
    name: 'Grand',
    game: Game.grand655,
    image: 'assets/images/grand-655.png',
  ),
  GameButton(
    name: 'Super',
    game: Game.super649,
    image: 'assets/images/super-649.png',
  ),
  GameButton(
    name: 'Mega',
    game: Game.mega645,
    image: 'assets/images/mega-645.png',
  ),
  GameButton(
    name: 'Lotto',
    game: Game.lotto642,
    image: 'assets/images/lotto-642.png',
  ),
  GameButton(
    name: '6Digit',
    game: Game.digit6,
    image: 'assets/images/6digit.png',
  ),
  GameButton(
    name: '4Digit',
    game: Game.digit4,
    image: 'assets/images/4digit.png',
  ),
  GameButton(
      name: 'Suertres',
      game: Game.suertres,
      image: 'assets/images/suertres.png'),
  GameButton(
    name: 'EZ2',
    game: Game.ez2,
    image: 'assets/images/ez2.png',
  ),
];

class GameButton extends StatelessWidget {
  const GameButton({this.name, this.game, this.image});

  final String name;
  final Game game;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (context, model, child) {
      return Padding(
        padding: const EdgeInsets.only(right: 14, top: 10),
        child: MergeSemantics(
          child: Column(
            children: <Widget>[
              FloatingActionButton(
                elevation: 2,
                child: Container(
                  width: 55,
                  height: 55,
                  child: Image.asset(image),
                ),
                backgroundColor: Colors.white,
                onPressed: () {
                  model.setSelectedGame(game);
                  analyticsResultsFiltered(game);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(name, style: Styles.lottoResultControllerTitle),
              )
            ],
          ),
        ),
      );
    });
  }
}
