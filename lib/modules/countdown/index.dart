import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './components/timer.dart';
import 'package:lotto/styles.dart';

class CountdownCardSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CountdownCardSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    final positiveAppBarSize = appBarSize > 0 ? appBarSize : 0.0;

    final date = DateTime.now();

    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height:
                appBarSize < kToolbarHeight ? positiveAppBarSize : appBarSize,
            child: Container(
              color: Theme.of(context).primaryColor,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16 * percent),
                child: Card(
                  color: Theme.of(context).accentColor,
                  // color: Colors.white,
                  elevation: 20.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '${DateFormat('EEEE').format(date)}',
                            style: Styles.countdownSubtitle,
                          ),
                          Text(
                            '${DateFormat('MMMMd').format(date)}',
                            style: Styles.countdownHeader,
                          ),
                        ],
                      ),
                      Container(
                        width: 150,
                        child: CountDownTimer(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
