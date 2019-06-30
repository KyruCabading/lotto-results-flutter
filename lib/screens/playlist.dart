import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:lotto/model/app_state_model.dart';
import 'package:lotto/styles.dart';

final playlistUrl = 'https://pcso-gov-playlist-json.herokuapp.com/';

class PlaylistScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlaylistScreenState();
  }
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateModel>(builder: (context, model, child) {
      final videos = model.getVideos();

      return Column(
        children: <Widget>[
          AppBar(
            title: Text(
              'Watch',
              style: Styles.appHeaderTitle,
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              displacement: 200,
              onRefresh: () => model.loadVideos(),
              child: ListVideo(
                list: videos,
              ),
            ),
          )
          // Expanded(
          //   child: FutureBuilder<List>(
          //     future: videos,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasError) print(snapshot.error);
          //       return snapshot.hasData
          //           ? ListVideo(list: snapshot.data)
          //           : Center(
          //               child: CircularProgressIndicator(),
          //             );
          //     },
          //   ),
          // )
        ],
      );
    });
  }
}

class ListVideo extends StatelessWidget {
  final List list;
  ListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Text(list[i]['snippet']['title']);
      },
    );
  }
}
