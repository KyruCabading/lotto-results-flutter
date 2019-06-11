import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:lotto/model/app_state_model.dart';
import 'results_header.dart';
import 'results_list.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (context, model, child) {
      final results = model.getResults();

      return NestedScrollView(
        headerSliverBuilder: (context, innerBoxScrolled) => [
              SliverPersistentHeader(
                delegate: ResultsHeaderSliverDelegate(
                  expandedHeight: 100,
                ),
              ),
            ],
        body: RefreshIndicator(
          displacement: 200,
          onRefresh: () => model.loadResults(),
          child: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              ...ResultsList(context: context, results: results).slivers
            ],
          ),
        ),
      );
    });
  }
}
