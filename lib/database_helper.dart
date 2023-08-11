import 'package:path/path.dart';
import 'camera_model.dart'; // Import the Camera model
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'my_cameras.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE My_cameras (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        brand TEXT,
        model TEXT,
        class TEXT,
        type TEXT,
        mount TEXT,
        serialNumber TEXT
      )
    ''');
  }

  Future<void> deleteCamera(int? id) async {
    final db = await instance.database;
    await db.delete('My_cameras', where: 'id = ?', whereArgs: [id!]);
  }


  Future<int> insertCamera(Camera camera) async {
    final db = await instance.database;
    return await db.insert('My_cameras', camera.toMap());
  }

  Future<List<Camera>> getAllCameras() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('My_cameras');
    return List.generate(maps.length, (i) {
      return Camera.fromMap(maps[i]);
    });
  }

  Future<void> updateCamera(Camera camera) async {
    final db = await instance.database;
    await db.update(
      'My_cameras',
      camera.toMap(),
      where: 'id = ?',
      whereArgs: [camera.id],
    );
  }
// Define other methods for CRUD operations here
}

