import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lotto/model/app_state_model.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:lotto/analytics.dart';
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

class ListVideo extends StatefulWidget {
  final List list;
  ListVideo({this.list});
  @override
  State<StatefulWidget> createState() {
    return _ListVideoState(list);
  }
}

class _ListVideoState extends State<ListVideo> {
  _ListVideoState(this.list);

  final List list;
  int selectedVideo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        final videoSnippet = list[i]['snippet'];
        final thumbnail = videoSnippet['thumbnails']['high']['url'];
        final title = videoSnippet['title'];
        final videoId = list[i]['contentDetails']['videoId'];

        return Container(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedVideo = i;
                    analyticsVideoSelected();
                  });
                },
                child: VideoPlayer(
                  videoId: videoId,
                  thumbnail: thumbnail,
                  isPreview: selectedVideo != i,
                ),
              ),
              Padding(
                child: Text(title, style: Styles.videoTitle),
                padding: const EdgeInsets.all(20),
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }
}

class VideoPlayer extends StatelessWidget {
  VideoPlayer({this.videoId, this.thumbnail, this.isPreview});

  final String videoId;
  final String thumbnail;
  final bool isPreview;

  @override
  Widget build(BuildContext context) {
    return isPreview
        ? Container(
            height: 210,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(thumbnail))),
          )
        : YoutubePlayer(
            context: context,
            source: videoId,
            quality: YoutubeQuality.HIGH,
            autoPlay: false,
          );
  }
}
