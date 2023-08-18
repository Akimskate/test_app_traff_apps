import 'dart:convert';

import 'package:flutter/services.dart';

import '../../domain/entities/novel.dart';
import '../database_helper.dart';

abstract class NovelRepository {
  Future<void> readJsonAndAddToDatabase();
}

Future<void> readJsonAndAddToDatabase() async {
  try {
    final jsonString = await rootBundle
        .loadString('lib/assets/novel.json'); // Путь к вашему JSON-файлу
    final jsonData = json.decode(jsonString);

    for (var novelData in jsonData) {
      final novel = Novel.fromJson(novelData);
      await DatabaseHelper.instance.addNovel(novel);
    }

    print('Novels added to the database successfully.');
  } catch (e) {
    print('Error reading JSON or adding novels to the database: $e');
  }
}
