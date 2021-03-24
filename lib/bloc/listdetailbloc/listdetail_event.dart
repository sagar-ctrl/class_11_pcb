import 'package:equatable/equatable.dart';

abstract class ListdetailEvent extends Equatable {
  const ListdetailEvent();
}

class AppStartedEvent extends ListdetailEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}


class ListItemSelected extends ListdetailEvent{
  String unitName;
  ListItemSelected({this.unitName});

  @override
  // TODO: implement props
  List<Object> get props => [unitName];

}


class PhysicsChapterSelected extends ListdetailEvent{

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class BiologyChapterSelected extends ListdetailEvent{

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ChemistryChapterSelected extends ListdetailEvent{

  @override
  // TODO: implement props
  List<Object> get props => [];
}