import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:lotto/styles.dart';

final playlistUrl = 'https://pcso-gov-playlist-json.herokuapp.com/';

class PlaylistScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlaylistScreenState();
  }
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  Future<List> getVideos() async {
    final response = await http.get(playlistUrl);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: Text(
            'Watch',
            style: Styles.appHeaderTitle,
          ),
        ),
        // FutureBuilder<List>(
        //   future: getVideos(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasError) print(snapshot.error);
        //     return snapshot.hasData
        //         ? ListVideo(list: snapshot.data)
        //         : CircularProgressIndicator();
        //   },
        // ),
      ],
    );
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
