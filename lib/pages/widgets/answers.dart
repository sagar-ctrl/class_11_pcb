

import 'package:flutter/material.dart';

import 'package:class_11_pcb/database/bookmark.dart';

Widget Answers(Map<String,dynamic>questionData,var parent){
   
  return Container(

    height: 300,
    
    margin: EdgeInsets.only(top: 490,left: 15.0,right: 15.0),
    child: SingleChildScrollView(
      child: Column(
        children: [
          
         AnswerRow(questionData,1,"a",parent),
        AnswerRow(questionData,2,"b",parent),
        AnswerRow(questionData,3,"c",parent),
        AnswerRow(questionData,4,"d",parent),
        ],
      ),
    ),
  );
}



Widget AnswerRow(Map<String,dynamic>data,int n,String val,var parent){
AnsweredQuestions ans=AnsweredQuestions.instance;

  return Column(children: [

    SizedBox(height: 10.0,),
       GestureDetector(
         
         onTap: (){
          
            AnsweredQuestions answeredQuestions= AnsweredQuestions.instance;
             answeredQuestions.insert(data);
          //  if(val==data['answer'][1].toLowerCase()){
           
            
          //    if(parent.n<15){
          //      parent.setState((){

          //        parent.n++;

          //      });
          //    }

          //  }
          //  else{
          //    print("wrong answer !!");
          //  }

           if(parent.n<15){
               parent.setState((){

                 parent.n++;

               });
             }
         },
         child:  Container(height:70.0,decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),color:Colors.white),
        child: Row(
          children: [
           
           Expanded(child:Padding(padding: EdgeInsets.only(left: 15.0),child:Text( 
                data['answer$n'],style:TextStyle(color: Colors.black,fontSize: 20.0,)
                ,maxLines: 3,overflow: TextOverflow.clip,),
                ),),
                
          
          ],
         
        ),
        ),
       ),
  ],);
}