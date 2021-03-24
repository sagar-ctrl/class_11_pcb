import 'package:class_11_pcb/helper%20class/Question.dart';
import 'package:equatable/equatable.dart';

abstract class QuizState extends Equatable {
  const QuizState();
}

class QuizInitial extends QuizState {
  @override
  List<Object> get props => [];
}


class QuizStartedStated extends QuizState{
  List<Map<String,dynamic>>physics;



  List<Map<String,dynamic>>chemistry;
  List<Map<String,dynamic>>biology;
  QuizStartedStated({this.physics, this.chemistry, this.biology});
  @override
  List<Object> get props => [physics,chemistry,biology];
}


class QuizLoadingState extends QuizState{
  QuizLoadingState(){

  }
  @override
  List<Object> get props =>[];
}


class QuizDownloadedState extends QuizState{
  @override
  List<Object> get props => [];

}


class SubjectSelectedState extends QuizState{
  String name;
  int n;
  SubjectSelectedState({this.name="physics",this.n});
  @override
  List<Object> get props => [];
}



class ChapterSelectedState extends QuizState
{
List<Map<String,dynamic>>questions;

ChapterSelectedState({this.questions});

  @override
  // TODO: implement props
  List<Object> get props =>[questions];
}


class NextQuestionState extends QuizState{
  int n;
  NextQuestionState({this.n});
  @override
  List<Object>get props=>[n];
}