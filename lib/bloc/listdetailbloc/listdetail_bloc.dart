import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:class_11_pcb/database/chapter_db.dart';

import 'package:http/http.dart' as http;


import 'bloc.dart';
import 'dart:convert' as convert;
class ListdetailBloc extends Bloc<ListdetailEvent, ListdetailState> {


  List<String>chaperTitle=[
    "units-measurements",
    'motion-straight-line',
    "motion-plane",
    'law-motion',
    'work-energy-power',
    'system-particles-rotational-motion',
    'gravitation',
    'mechanical-properties-solids',
    'mechanical-properties-fluids',
    'thermal-properties-matter',
    'thermodynamics',
    'kinetic-theory',
    'oscillations',
    'waves'

  ];


  List<String>biologyTopics=['living-world',"biological-classification",
  "plant-kingdom","animal-kingdom","morphology-flowering","anatomy-flowering-plants",
    'structural-organisation-animals','cell-unit-life','biomolecules','cell-cycle-cell-division',
    'transport-plants','mineral-nutrition','photosynthesis-higher-plants','respiration-plants',
    'plant-growth-development','digestion-absorption','breathing-exchange-gases','body-fluids-circulation',
    'locomotion-movement','neural-control-coordination','chemical-coordination-integration'

  ];

  ListdetailBloc() : super(ListdetailInitial());


  @override
  ListdetailState get initialState => ListdetailInitial();

  @override
  Stream<ListdetailState> mapEventToState(
    ListdetailEvent event,
  ) async* {
    if(event is AppStartedEvent){
          yield AppStartedState(chapter:chaperTitle);
    }
    if(event is ListItemSelected){
      yield LoadingState();

      ChapterDatabase chapterDatabase=ChapterDatabase.instance;
      

      String name=event.unitName;
      var data=await chapterDatabase.checkChapter(name);
      if(data[0]['COUNT(id)']==0){
      var client=http.Client();

      var chapter=await http.get(Uri.http('quizapp3287.herokuapp.com','api/getChapter/$name/'));


      var jsonResponse=convert.jsonDecode(chapter.body);
      chapterDatabase.insert(jsonResponse);
      String html=jsonResponse['htmlData'];
      String unit=jsonResponse["unit"];

      yield ItemSelectedState(htmlData: html,unit:unit);}

      else{

    List<Map<String, dynamic>>datas=await chapterDatabase.getChapter(name);

    String html=datas[0]['htmlData'];
    String unit=datas[0]['unit'];

    yield ItemSelectedState(htmlData: html,unit: unit);



      }

    }
if(event is PhysicsChapterSelected){
  yield PhysicsState(chapter: chaperTitle);
}
if(event is BiologyChapterSelected){
  yield BiologyState(chapter: biologyTopics);
}

  }
}
