import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lotto/model/app_state_model.dart';
import 'package:youtube_player/youtube_player.dart';
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
              VideoPlayer(
                videoId: videoId,
                thumbnail: thumbnail,
              ),
              Padding(
                child: Text(
                  title,
                  style: Styles.videoTitle,
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

class VideoPlayer extends StatefulWidget {
  final videoId;
  final thumbnail;
  VideoPlayer({this.videoId, this.thumbnail});

  @override
  State<StatefulWidget> createState() {
    return _VideoPlayerState(videoId, thumbnail);
  }
}

class _VideoPlayerState extends State<VideoPlayer> {
  _VideoPlayerState(this.videoId, this.thumbnail);

  final String videoId;
  final String thumbnail;
  bool displayPlayer = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          displayPlayer = !displayPlayer;
        });
      },
      child: displayPlayer
          ? YoutubePlayer(
              context: context,
              source: videoId,
              quality: YoutubeQuality.HIGH,
              autoPlay: false,
            )
          : Container(
              height: 210,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(thumbnail))),
            ),
    );
  }
}
