

import 'package:flutter/material.dart';
import 'package:class_11_pcb/database/bookmark.dart';
import 'package:sqflite/sqflite.dart';
class PreviousQuestions extends StatefulWidget {
  PreviousQuestions({Key key}) : super(key: key);

  @override
  _PreviousQuestionsState createState() => _PreviousQuestionsState();
}

class _PreviousQuestionsState extends State<PreviousQuestions> {

  AnsweredQuestions instances=AnsweredQuestions.instance;
  

  List<Map<String,dynamic>> data=[];
  
 @override
 void initState()async{

   // Database db=await instances.database;
   // data=await instances.fetchData();
   // setState((){});
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body:StreamBuilder(
      
    ),
    );
  }
}