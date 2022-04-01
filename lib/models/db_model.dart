import 'package:currency_converter/models/history_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseConnect {
  Database? _database;
  Future<Database> get database async {
    final dbPath = await getDatabasesPath();
    const dbName = 'history.db';
    final path = p.join(dbPath, dbName);

    _database = await openDatabase(path, version: 1, onCreate: _createDb);
    return _database!;
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute(
        'CREATE TABLE history( id INTEGER PRIMARY KEY, value TEXT, date TEXT )');
  }

  Future<int> addToHistory(List<History> history) async {
    int result = 0;
    final db = await database;
    for (var history in history) {
      result = await db.insert('history', history.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    return result;
  }

  Future<List<History>> getHistory() async {
    final db = await database;
    final List<Map<String, Object?>> history = await db.query('history');
    return history.map((e) => History.fromMap(e)).toList();
  }

  Future deleteHistory(int id) async {
    final db = await database;
    await db.delete('history', where: 'id = ?', whereArgs: [id]);
  }
}
