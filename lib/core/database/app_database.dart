import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const _dbName = 'cv_builder.db';
  static const _dbVersion = 1;
  static const tableName = 'cv';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            full_name TEXT NOT NULL,
            job_title TEXT NOT NULL,
            email TEXT NOT NULL,
            phone TEXT NOT NULL,
            summary TEXT NOT NULL,
            education TEXT NOT NULL,
            experience TEXT NOT NULL,
            skills TEXT NOT NULL,
            template_id INTEGER NOT NULL,
            updated_at TEXT NOT NULL
          )
        ''');
      },
    );
  }
}
