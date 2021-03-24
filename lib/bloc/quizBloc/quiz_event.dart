import 'package:equatable/equatable.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizStartedEvent extends QuizEvent{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class SubjectSelected extends QuizEvent{
  String name;
  SubjectSelected({this.name="physics"});
  @override
  List<Object> get props => [];
}


class ChapterSelected extends QuizEvent{
  
  String name;
  int n;
  ChapterSelected({this.n,this.name});
  @override
  List<Object> get props => [name,n];
}


class NextQuestionEvent extends QuizEvent{
  int n;
  NextQuestionEvent({this.n});
  @override
  List<Object>get props=>[n];
}