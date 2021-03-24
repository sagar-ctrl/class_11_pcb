import 'package:class_11_pcb/pages/previous.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:class_11_pcb/pages/quiz_collection_divide.dart';



Widget SubjectListTIle(String subjectName,String imageUrl,double width,BuildContext context){

  return GestureDetector(
    onTap: (){
      print("hello");
      if(subjectName=="Solutions"){
         Navigator.push(context,MaterialPageRoute(builder:(context)=>PreviousQuestions()));
      }
      else{
        Navigator.push(context,MaterialPageRoute(builder:(context)=>QuizCollection(name: subjectName,)));
      }
    },
    child: Container(
      height:70.0,
      width:width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),

      child: Row(
        children: [
          SizedBox(width: 10.0),

          Image.asset(imageUrl),
          SizedBox(width: 10.0),
          Text(subjectName,style: TextStyle(fontSize: 25.0,color:Color(0xFF2D4159)),)
        ],
      ),
    ),
  );
}