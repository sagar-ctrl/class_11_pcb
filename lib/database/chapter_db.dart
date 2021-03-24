


import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ChapterDatabase{

  static final _databaseName='chapter.db';
  static final _databaseVersion=1;
  static final table='chapter';
  static final columnHtml='htmlData';
  static final columnId='id';
  static final columnUnit='unit';
  static final columnSubject='subject';

  Database _database;

  ChapterDatabase._privateConstructor();

 static final ChapterDatabase instance=ChapterDatabase._privateConstructor();

  Future<Database> get database async{
    if(_database!=null){
      return _database;
    }
    _database=await _initDatabase();
    return _database;
  }

  _initDatabase()async{
    Directory _documentDirectory=await getApplicationDocumentsDirectory();
    String path=join(_documentDirectory.path,_databaseName);

    return await openDatabase(path,version: _databaseVersion,onCreate: _onCreate);
  }


  _onCreate(Database db,int version)async{
    await db.execute('''
    CREATE TABLE $table(
    $columnId INTEGER,
    $columnHtml VARCHAR,
    $columnUnit VARCHAR,
    $columnSubject VARCHAR
    )
    ''');
  }


  Future<int>insert(Map<String,dynamic>row)async{
    Database db=await instance.database;
    return db.insert(table,row);
  }


  Future<List<Map<String,dynamic>>>getChapter (String chapter)async{
    Database db=await instance.database;

    return await db.rawQuery('''
     SELECT * FROM $table WHERE unit = ?
    ''',[chapter]);
  }


  Future<List<Map<String, dynamic>>> getItemCount()async{
    Database db=await instance.database;
    return await db.rawQuery('''
    SELECT COUNT($columnId) FROM $table 
    ''');
  }


  Future<List<Map<String, dynamic>>> checkChapter(String chapter)async{
    Database db=await instance.database;
    return await db.rawQuery('''
    SELECT COUNT($columnId) FROM $table WHERE unit = ?
    ''',[chapter]);
  }

}