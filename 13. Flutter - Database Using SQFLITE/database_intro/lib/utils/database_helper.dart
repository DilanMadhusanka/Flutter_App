import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  
  factory DatabaseHelper() => _instance;

  final String tableUser = "userTable";
  final String columnId = "id";
  final String columnUserName = "userName";
  final String columnPassword = "password";

  static Database _db;
  Future<Database> get db async {
    if(_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDerectory = await getApplicationDocumentsDirectory();
    String path = join(documentDerectory.path, "maindb.db");
    var ourDb = await openDatabase(path, version: 1, onCreate:_onCreate)
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE $tableUser($columnId INTEGER PRIMARY KEY, $columnUserName TEXT, $columnPassword TEXT)"
    );
  }
}