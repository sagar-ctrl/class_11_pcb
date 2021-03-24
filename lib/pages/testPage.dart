
import 'package:class_11_pcb/database/quiz_db.dart';
import 'package:flutter/material.dart';

class GetAllQuestionOffline extends StatefulWidget {
  @override
  _GetAllQuestionOfflineState createState() => _GetAllQuestionOfflineState();
}

class _GetAllQuestionOfflineState extends State<GetAllQuestionOffline> {

  List<Map<String,dynamic>>questions;
  void getSubject()async{
    DatabaseHelper databaseHelper=await DatabaseHelper.instance;
    var data=await databaseHelper.getItemCount();
    print(data[0]['id']);

   List<Map<String,dynamic>> question=await databaseHelper.getSubjectQuestions('biology');
    setState(() {
      questions=question;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSubject();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('All the Questions'),),
        body: questions==null?Center(child: CircularProgressIndicator(),):ListView.builder(itemCount:questions.length,itemBuilder: (contex,index){
          return ListTile(title: Text(questions[index]['title']),);
        }) ,
      ),
    );
  }
}
