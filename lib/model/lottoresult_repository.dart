import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'lottoresult.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LottoResultRepository {
  static Future<List<DocumentSnapshot>> _fetchLottoResults() async {
    final QuerySnapshot querySnapshot = await Firestore.instance
        .collection('lottoresults')
        .orderBy('date', descending: true)
        .limit(200)
        .getDocuments();

    return querySnapshot.documents;
  }

  static Future loadResults() async {
    List<DocumentSnapshot> results = await _fetchLottoResults();

    final List<LottoResult> lottoResults =
        results.map((item) => LottoResult.fromJson(item)).toList();

    return lottoResults;
  }
}
