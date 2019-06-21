import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lotto/model/lottoresult.dart';
import './numbers.dart';
import 'package:lotto/styles.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({this.lottoResult});

  final LottoResult lottoResult;

  @override
  Widget build(BuildContext context) {
    final String jackpotValueText =
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
