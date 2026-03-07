import '../../core/database/app_database.dart';
import '../models/cv_model.dart';

class CVRepository {
  CVRepository(this._database);

  final AppDatabase _database;

  Future<CVModel?> getLatestCV() async {
    final db = await _database.database;
    final result = await db.query(
      AppDatabase.tableName,
      orderBy: 'updated_at DESC',
      limit: 1,
    );

    if (result.isEmpty) return null;
    return CVModel.fromMap(result.first);
  }

  Future<int> saveCV(CVModel cv) async {
    final db = await _database.database;

    if (cv.id == null) {
      return db.insert(AppDatabase.tableName, cv.toMap());
    }

    await db.update(
      AppDatabase.tableName,
      cv.toMap(),
      where: 'id = ?',
      whereArgs: [cv.id],
    );
    return cv.id!;
  }
}
