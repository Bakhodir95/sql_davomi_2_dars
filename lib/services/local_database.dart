import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  LocalDatabase._singleton();

  static final LocalDatabase _localDatabase = LocalDatabase._singleton();

  factory LocalDatabase() {
    return _localDatabase;
  }
  Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = "$databasePath/notes.db";
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int versrion) async {
    return await db.execute("""
  CREATE TABLE notes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    createdData TEXT NOT NULL
  )
""");
  }
}
