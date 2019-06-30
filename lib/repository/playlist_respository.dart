import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final playlistUrl = 'https://pcso-gov-playlist-json.herokuapp.com/';

class PlaylistRepository {
  static Future<List> loadVideos() async {
    final response = await http.get(playlistUrl);
    return json.decode(response.body);
  }
}
