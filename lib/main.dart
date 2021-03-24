import 'package:class_11_pcb/bloc/listdetailbloc/bloc.dart';
import 'package:class_11_pcb/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
       return BlocProvider<ListdetailBloc>(create: (_)=>ListdetailBloc()..add(AppStartedEvent()),
       child: HomePage(),

       );


  }
}

