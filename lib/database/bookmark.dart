



import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';



class AnsweredQuestions{
 static final _databasename='saved.db';

 static final _databaseversion=1;

 static final columnId='id';
  static final table='answeredQuestion';

  static final columnTitle="title";
  static final columnAnswer1="answer1";
  static final columnAnswer2="answer2";
  static final columnAnswer3="answer3";
  static final columnAnswer4="answer4";
  static final columnAnswer="answer";
  static final columnSubject="subject";


Database _database;

AnsweredQuestions._privateConstructor();

static final AnsweredQuestions instance=AnsweredQuestions._privateConstructor();

Future<Database> get database async {
  print(_database.runtimeType);
  if(_database!=null){
    print("i exists");
    return  _database;
  }

_database=await _initDatabase();
return  _database;
}

_initDatabase()async{
 print('int');
 Directory directory=await getApplicationDocumentsDirectory();

 String path=join(directory.path,_databasename);

 return await openDatabase(path,onCreate:_onCreate,version: _databaseversion);


}

 Future _onCreate(Database db,int version)async{
   print("iam here");
    await db.execute('''CREATE TABLE $table (
    $columnId INTEGER,
    $columnTitle VARCHAR,
    $columnAnswer1 VARCHAR,
    $columnAnswer2 VARCHAR,
    $columnAnswer3 VARCHAR,
    $columnAnswer4 VARCHAR,
    $columnAnswer VARCHAR,
    $columnSubject VARCHAR,
    sn INTEGER 
    
    
    )''');
  }


Future<int> insert(Map<String,dynamic>row)async{

Database db=await instance.database;

return await db.insert(table,row);

}


Future<List<Map<String,dynamic>>>fetchData()async{
  Database db=await instance.database;

  return await db.rawQuery('''
  SELECT * FROM $table
  ''');


}



}