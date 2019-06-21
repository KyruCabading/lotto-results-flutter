import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lotto/modules/results/components/result_card.dart';
import 'package:provider/provider.dart';
import "package:collection/collection.dart";
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:lotto/model/app_state_model.dart';
import 'package:lotto/model/lottoresult.dart';
import './components/gamebutton.dart';
import 'package:lotto/styles.dart';

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
    return ResultCard(
      lottoResult: lottoResult,
    );
  }
}
