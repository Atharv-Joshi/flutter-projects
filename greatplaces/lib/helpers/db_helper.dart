import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;


class DBHelper{

  //connect
  static Future<sql.Database> connect() async {
    final dbPath = await sql.getDatabasesPath();

    return sql.openDatabase(path.join(dbPath , 'places.db') , onCreate: (db , version){
      db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY , title TEXT , image TEXT)');
    } , version: 1);
  }//connect

  //insert
  static Future<void> insert(String table , Map<String , Object> data) async {
    final db = await DBHelper.connect();

    await db.insert(table, data , conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }//insert

  //get
  static Future<List<Map<String,dynamic>>> get(String table) async {
    final db = await DBHelper.connect();
    
    return db.query(table);
  }//get

}