import 'package:flutter/material.dart';
import 'package:lotto/modules/results/components/result_card.dart';
import "package:collection/collection.dart";
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:lotto/model/lottoresult.dart';
import './components/results_list_sideheader.dart';
import './components/results_list_controller.dart';
import 'package:lotto/styles.dart';

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
    return ResultsListSideheader(
      date: date,
    );
  }

  static Widget _buildTile(BuildContext context, LottoResult lottoResult) {
    return ResultCard(
      lottoResult: lottoResult,
    );
  }
}
