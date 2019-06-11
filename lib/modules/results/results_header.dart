import 'package:flutter/material.dart';
import 'package:lotto/styles.dart';
import 'countdown.dart';

class ResultsHeaderSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  ResultsHeaderSliverDelegate({
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
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height:
                appBarSize < kToolbarHeight ? positiveAppBarSize : appBarSize,
            child: Container(
              color: Theme.of(context).accentColor,
              // elevation: 0,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            // child: Opacity(
            //   opacity: percent,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 16 * percent),
            //     child: Card(
            //       color: Colors.white,
            //       elevation: 20.0,
            //       child: Padding(
            //         padding: EdgeInsets.symmetric(horizontal: 10),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceAround,
            //           children: <Widget>[
            //             Image.asset(
            //               'assets/images/wheel.png',
            //             ),
            //             CountDownTimer()
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            child: Opacity(
              opacity: percent,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 16 * percent, vertical: 10 * percent),
                    child: Card(
                      color: Colors.white,
                      elevation: 20.0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 60),
                        child: CountDownTimer(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Image.asset(
                      'assets/images/lotto.png',
                    ),
                  )
                ],
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
