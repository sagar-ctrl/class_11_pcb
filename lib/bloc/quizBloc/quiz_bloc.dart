import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:class_11_pcb/bloc/listdetailbloc/bloc.dart';
import 'package:class_11_pcb/database/quiz_db.dart';
import 'package:class_11_pcb/helper%20class/Question.dart';

import 'bloc.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart'as http;

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial());





  @override
  QuizState get initialState => QuizInitial();

  @override
  Stream<QuizState> mapEventToState(
    QuizEvent event,
  ) async* {
      if(event is QuizStartedEvent){

        DatabaseHelper databaseHelper=DatabaseHelper.instance;

           List<Map<String,dynamic>>phyics=[];List<Map<String,dynamic>>chemistry=[];List<Map<String,dynamic>>biology=[];
           yield QuizLoadingState();




           var data=await databaseHelper.getItemCount();
           if(data[0]['COUNT(id)']==0){
           var res1=await http.get(Uri.http('quizapp3287.herokuapp.com','api/questions/physics'));
           var jsres=convert.jsonDecode(res1.body);

           for(var ques in jsres){
             phyics.add(ques);

             databaseHelper.insert(ques);
           }

           var res2=await http.get(Uri.http('quizapp3287.herokuapp.com','api/questions/chemistry'));
           var jsres2=convert.jsonDecode(res2.body);
           for(var ques in jsres2){
             // DatabaseHelper databaseHelper=DatabaseHelper.instance;
             // databaseHelper.insert(ques);
             chemistry.add(ques);
             databaseHelper.insert(ques);
           }
           var res3=await http.get(Uri.http('quizapp3287.herokuapp.com','api/questions/biology'));
           var jsres3=convert.jsonDecode(res3.body);
           for(var ques in jsres3){


             databaseHelper.insert(ques);
             biology.add(ques);
           }

           // yield QuizStartedStated(physics: phyics,chemistry: chemistry,biology: biology);
           yield QuizDownloadedState();
           }


           else{
             phyics=await databaseHelper.getSubjectQuestions('physics');
             chemistry=await databaseHelper.getSubjectQuestions('chemistry');
             biology=await databaseHelper.getSubjectQuestions('biology');



             yield QuizStartedStated(physics: phyics,chemistry: chemistry,biology: biology);
           }



      }
      if(event is SubjectSelected){
        DatabaseHelper databaseHelper=DatabaseHelper.instance;
        yield QuizLoadingState();
        var data=await databaseHelper.getSubjectCount(event.name.toLowerCase());


        int n=data[0]['COUNT(id)'];
        double numberOfPage=n/15;


       yield SubjectSelectedState(name: event.name,n:numberOfPage.ceil() );

      }

      if(event is ChapterSelected){
        yield QuizLoadingState();
        List<Map<String,dynamic>> questions=[];
        int n=event.n-1;
        n=n*15;
        int j=n+15;
        DatabaseHelper databaseHelper=DatabaseHelper.instance;
        questions=await databaseHelper.getQuestion(n, j);
        
                yield ChapterSelectedState(questions:questions);

      }

      if(event is NextQuestionEvent){

        yield NextQuestionState(n: event.n+1);
      }








  }




}
