import 'package:equatable/equatable.dart';

abstract class ListdetailState extends Equatable {
  const ListdetailState();
}

class ListdetailInitial extends ListdetailState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}


class AppStartedState extends ListdetailState{
  List<String>chapter;
  AppStartedState({this.chapter});

  @override
  List<Object> get props => [chapter];


}


class ItemSelectedState extends ListdetailState{
  String htmlData,unit;
  ItemSelectedState({this.htmlData,this.unit});
  @override
  // TODO: implement props
  List<Object> get props =>[htmlData];

}


class LoadingState extends ListdetailState{
  @override

  List<Object> get props => throw UnimplementedError();
}


class PhysicsState extends ListdetailState{
  List<String> chapter;
  PhysicsState({this.chapter});
  @override
  List<Object> get props => [chapter];
}

class ChemistryState extends ListdetailState{
  List<String> chapter;
  ChemistryState({this.chapter});
  @override
  List<Object> get props => [chapter];
}

class BiologyState extends ListdetailState{
  List<String> chapter;

  BiologyState({this.chapter});
  @override
  List<Object> get props => [chapter];
}


