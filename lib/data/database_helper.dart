import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test_app_traff_apps/domain/entities/novel.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'novels.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
  CREATE TABLE novels(
    id INTEGER PRIMARY KEY,
      title TEXT,
      author TEXT,
      description TEXT,
      posterUrl TEXT,
      genres TEXT,
      isNewRelease INTEGER,
      chapters TEXT
  )
 ''');
  }

  Future<List<Novel>> getNovel() async {
    try {
      Database db = await instance.database;
      var novels = await db.query('novels', orderBy: 'author');

      List<Novel> novelList = novels.map((e) => Novel.fromJson(e)).toList();
      if (novelList.isNotEmpty) {
        print('Data successfully retrieved');
      }
      return novelList;
    } catch (e) {
      print('Error while retrieving novels: $e');
      return [];
    }
  }

  Future<int> addNovel(Novel novel) async {
    Database db = await instance.database;
    return await db.insert('novels', novel.toJson());
  }
}
