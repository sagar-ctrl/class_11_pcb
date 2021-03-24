

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
 static final _databasename='quiz.db';

 static final _databaseversion=1;

 static final columnId='id';
  static final table='quiz';

  static final columnTitle="title";
  static final columnAnswer1="answer1";
  static final columnAnswer2="answer2";
  static final columnAnswer3="answer3";
  static final columnAnswer4="answer4";
  static final columnAnswer="answer";
  static final columnSubject="subject";


  Database _database;

  Future<Database> get database async{
     if(_database !=null)return _database;
     _database=await _initDatabase();
     return _database;

  }

  _initDatabase()async{
    Directory _documentDirectory=await getApplicationDocumentsDirectory();
    print(join(_documentDirectory.path,_databasename));
    String path=join(_documentDirectory.path,_databasename);
    return await openDatabase(path,onCreate:_onCreate,version: _databaseversion );
  }

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance=DatabaseHelper._privateConstructor();

  Future _onCreate(Database db,int version)async{
    await db.execute('''CREATE TABLE $table (
    $columnId INTEGER,
    $columnTitle VARCHAR,
    $columnAnswer1 VARCHAR,
    $columnAnswer2 VARCHAR,
    $columnAnswer3 VARCHAR,
    $columnAnswer4 VARCHAR,
    $columnAnswer VARCHAR,
    $columnSubject VARCHAR,
    sn INTEGER PRIMARY KEY
    
    
    )''');
  }


  Future<int>insert(Map<String,dynamic>row)async{
    Database db=await instance.database;
    return await db.insert(table,row);
  }

  Future<List<Map<String,dynamic>>>getSubjectQuestions(String subName )async{
    Database db=await instance.database;
    return await db.rawQuery('''SELECT * FROM $table WHERE subject = ?''',[subName]);
  }

 Future<List<Map<String, dynamic>>> getItemCount()async{

    Database db=await instance.database;
    return await db.rawQuery('''SELECT COUNT($columnId) FROM $table''');

  }


  Future<List<Map<String,dynamic>>> getSubjectCount(String name)async{

    Database db=await instance.database;
    return await db.rawQuery('''SELECT COUNT(id) FROM $table WHERE $columnSubject = ?''',[name]);

  }

  Future<List<Map<String,dynamic>>>getQuestion(int i,int j)async{
    Database db=await instance.database;
    return await db.rawQuery('''SELECT * FROM $table WHERE sn BETWEEN '$i' AND '$j' ''');

  }



}