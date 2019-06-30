import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lotto/model/app_state_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lotto/styles.dart';

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
        final thumbnail = list[i]['snippet']['thumbnails']['high']['url'];

        final title = list[i]['snippet']['title'];
        final videoId = list[i]['contentDetails']['videoId'];

        return Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              YoutubePlayer(
                key: Key(videoId),
                context: context,
                videoId: videoId,
                flags: YoutubePlayerFlags(
                  autoPlay: false,
                  showVideoProgressIndicator: true,
                ),
                videoProgressIndicatorColor: Colors.amber,
              ),
              Padding(
                child: Text(
                  title,
                  style: Styles.playlistTitle,
                ),
                padding: const EdgeInsets.all(15),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}
