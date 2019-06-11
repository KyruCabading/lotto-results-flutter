import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'lottoresult.dart';
import 'package:http/http.dart' as http;

class LottoResultRepository {
  static Future<String> _fetchLottoResults() async {
    final response = await http
        .get('https://api.sheety.co/8d9adee1-3854-4b6f-aaac-741a58edd0d8');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return response.body;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future loadResults() async {
    String resultsString = await _fetchLottoResults();
    final List jsonResponse = json.decode(resultsString);
    final List<LottoResult> lottoResults = jsonResponse.reversed
        .map((item) => LottoResult.fromJson(item))
        .toList();
    return lottoResults; // Return Latest First
  }
}
