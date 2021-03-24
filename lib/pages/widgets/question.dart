


import 'package:flutter/material.dart';


Widget QuestionContainer(String question,int qn){

  return Container(height: 280.0,
  margin: EdgeInsets.only(top: 180.0,left: 15.0,right:15.0),
  decoration: BoxDecoration(
      boxShadow:[
        BoxShadow(color: Colors.black,
        blurRadius: 15.0
        ),
        
      ],
    color: Colors.white,borderRadius: BorderRadius.circular(15.0),

    

  ),
  child: SingleChildScrollView(
    child: Column(
     children: [
       SizedBox(height: 60.0,),
       Center(child: Text("Question ${qn+1} /15",style: TextStyle(fontSize: 22.0,color: Color(0xFFa25bd9),fontWeight: FontWeight.w800),),),

       SizedBox(height: 40,),
       Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),child: Text((question.substring(16)),
       style:TextStyle(fontWeight: FontWeight.w500,fontSize: 20.0)
       ),)
     ],
    ),
  ),
  );
}