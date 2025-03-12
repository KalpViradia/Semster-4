import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async{
    if (_database != null) return _database!;
    _database = await _initDB('users.db');
    return _database!;
  }

  Future<Database> _initDB(String filepath) async{
    final dbpath = await getDatabasesPath();
    final path = join(dbpath,filepath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async{
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age TEXT NOT NULL,
        city TEXT NOT NULL      
      )
    ''');
  }

  Future<int> addUser(Map<String, dynamic> users) async{
    final db = await database;
    return await db.insert('users',users);
  }

  Future<List<Map<String,dynamic>>> getUsers() async{
    final db = await database;
    return await db.query('users');
  }

  Future<int> updateUser(Map<String, dynamic> users) async{
    final db = await database;
    return await db.update('users',users, where: 'id = ?', whereArgs: [users['id']]);
  }

  Future<int> deleteUser(int id) async{
    final db = await database;
    return await db.delete('users', where: 'id = ?',whereArgs: [id]);
  }
}