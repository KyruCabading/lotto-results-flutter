import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import "package:collection/collection.dart";
import 'package:lotto/styles.dart';
import 'package:intl/intl.dart';
import 'package:lotto/model/app_state_model.dart';

import 'package:lotto/model/lottoresult.dart';
import 'numbers.dart';

class ResultsList {
  const ResultsList({
    @required this.context,
    @required this.results,
  })  : assert(results != null),
        assert(context != null);

  final BuildContext context;
  final List<LottoResult> results;

  List<Widget> get slivers => _buildResultsSlivers(context, results);

  static List<Widget> _buildResultsSlivers(
      BuildContext context, List<LottoResult> results) {
    List<Widget> slivers = new List<Widget>();

    final Map<DateTime, List> resultsByDate =
        groupBy(results, (obj) => obj.date);

    resultsByDate.forEach((date, resultsList) {
      resultsList.sort((a, b) {
        return a.priority.compareTo(b.priority);
      });
      slivers.add(_buildSideHeaderGrid(context, date, resultsList));
    });

    return [
      SliverAppBar(
        pinned: true,
        centerTitle: false,
        title: Text(
          'Results',
          style: Styles.appHeaderTitle,
        ),
      ),
      ResultsListController(),
      ...slivers
    ];
  }

  static Widget _buildSideHeaderGrid(
      BuildContext context, DateTime date, List resultsList) {
    return SliverStickyHeader(
      overlapsContent: true,
      header: _buildSideHeader(context, date),
      sliver: SliverPadding(
        padding: EdgeInsets.only(left: 54, top: 14, bottom: 38, right: 16),
        sliver: SliverList(
          delegate: new SliverChildBuilderDelegate(
            (context, i) => _buildTile(context, resultsList[i]),
            childCount: resultsList.length,
          ),
        ),
      ),
    );
  }

  static Widget _buildSideHeader(BuildContext context, DateTime date) {
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

  static Widget _buildTile(BuildContext context, LottoResult lottoResult) {
    final jackpotValueText =
        NumberFormat.simpleCurrency(name: 'PHP').format(lottoResult.jackpot);

    final winnerNumberText = '${lottoResult.winners} winners';

    return Card(
      color: lottoResult.color,
      child: ListTile(
        dense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: <Widget>[
              Text(
                '${lottoResult.name}',
                style: Styles.lottoResultTitle,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Icon(
                    lottoResult.icon,
                    color: Colors.orangeAccent,
                    size: 16,
                  )),
            ],
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NumberBalls(
                  numberValues: lottoResult.combination,
                  color: lottoResult.color,
                )),
            Text(
              '$jackpotValueText • $winnerNumberText',
              style: Styles.lottoResultJackpot,
            ),
          ],
        ),
      ),
    );
  }
}

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
            children: <Widget>[
              _buildButton('All', Game.all, 'assets/images/pcso.png', model),
              _buildButton(
                  'Ultra', Game.ultra658, 'assets/images/ultra-658.png', model),
              _buildButton(
                  'Mega', Game.mega645, 'assets/images/mega-645.png', model),
              _buildButton(
                  'Super', Game.super649, 'assets/images/super-649.png', model),
              _buildButton(
                  'Lotto', Game.lotto642, 'assets/images/lotto-642.png', model),
              _buildButton(
                  '6Digit', Game.digit6, 'assets/images/6digit.png', model),
              _buildButton(
                  '4Digit', Game.digit4, 'assets/images/4digit.png', model),
              _buildButton('Suertres', Game.suertres,
                  'assets/images/suertres.png', model),
              _buildButton('EZ2', Game.ez2, 'assets/images/ez2.png', model),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildButton(
      String name, Game game, String image, AppStateModel model) {
    return Padding(
      padding: const EdgeInsets.only(right: 14, top: 10),
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
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(name, style: Styles.lottoResultControllerTitle),
          )
        ],
      ),
    );
  }
}
