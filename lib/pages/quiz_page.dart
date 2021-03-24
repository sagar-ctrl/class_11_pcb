import 'package:class_11_pcb/bloc/listdetailbloc/bloc.dart';
import 'package:class_11_pcb/bloc/quizBloc/bloc.dart';
import 'package:class_11_pcb/helper%20class/Question.dart';
import 'package:class_11_pcb/pages/widgets/quiz_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(brightness: Brightness.dark),
      home: BlocProvider<QuizBloc>(create: (context)=>QuizBloc()..add(QuizStartedEvent()),
        child: QuizBodyPage(),
        ),

    );
  }
}


class QuizBodyPage extends StatefulWidget {
  @override
  _QuizBodyPageState createState() => _QuizBodyPageState();
}

class _QuizBodyPageState extends State<QuizBodyPage> {
  @override
  Widget build(BuildContext context) {
    QuizBloc quizBloc=BlocProvider.of<QuizBloc>(context,listen: false);
    return BlocBuilder<QuizBloc,QuizState>(builder:(context,state){
      List<Map<String,dynamic>>physics,chemistry,biology;
      int n=0;
      if(state is LoadingState){
        physics=null;
        chemistry=null;
        biology=null;
      }

      if(state is QuizStartedStated){
        n=state.physics.length+state.chemistry.length+state.biology.length;
      }



      if(state is QuizDownloadedState){
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Text('The Questions are Loaded SuccessFull',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w400),),
              ElevatedButton.icon(onPressed: (){
      quizBloc.add(QuizStartedEvent());

              }, icon: Icon(Icons.download_done_rounded), label:Text('Go To Quiz',))
            ],),
          ),
        );
      }

  return Scaffold(
    appBar: AppBar(

      backgroundColor: Color(0xFF2D4159),elevation: 0.0,
    bottom: AppBar(
      title: Text('Quiz Title',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w300),),
      backgroundColor: Color(0xFF2D4159),elevation: 0.0,
      centerTitle: true,
    ),
    ),
    body:n>0?Stack(
      children: [
        Container(color: Color(0xFF242A40)),
        Container(

          height: 30,decoration: BoxDecoration(color: Color(0xFF2D4159),borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),boxShadow: [
          BoxShadow(color: Colors.black,
          blurRadius: 50)
        ]),

        ),
        SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.only(left: 40.0,top: 60.0),
             child: Column(

               children: [
                 Container(height: 70,width: MediaQuery.of(context).size.width*0.8,
                 decoration: BoxDecoration(color: Color(0xFFe4832f),
                 borderRadius: BorderRadius.circular(10.0)
                 ),
                   child: Row(
                     children: [SizedBox(width: 10.0,),
                     Container(
                       padding: EdgeInsets.only(top: 5.0),
                       height: 70,width: 150,child: Column(
                       children: [
                         Text('Total Question',style: TextStyle(fontSize: 15.0),),
                         SizedBox(height: 5.0,),
                         Text("${n}",style: TextStyle(fontSize: 25.0),)
                       ],
                     ),),
                       Container(height: 60,width: 1.0,color: Colors.white,),
                       SizedBox(width: 10.0,),

                       Container(

                         padding: EdgeInsets.only(top: 5.0),
                         height: 70,child: Column(
                         children: [
                           Text('Correct Answer',style: TextStyle(fontSize: 15.0),),
                           SizedBox(height: 5.0,),
                           Text('255',style: TextStyle(fontSize: 25.0),)
                         ],
                       ),),


                     ],
                   ),
                 ),
                 SizedBox(height: 50.0,),
                 SubjectListTIle("Physics",'assets/physicsLogo.png',MediaQuery.of(context).size.width*0.8,context),
                 SizedBox(height: 50.0,),
                 SubjectListTIle("Biology",'assets/BioLogo.png',MediaQuery.of(context).size.width*0.8,context),
                 SizedBox(height: 50.0,),
                 SubjectListTIle("Chemistry",'assets/chemistryLogo.png',MediaQuery.of(context).size.width*0.8,context),
                 SizedBox(height: 50.0,),
                 SubjectListTIle("Solutions",'assets/Solutions.jpg',MediaQuery.of(context).size.width*0.8,context),
                 SizedBox(height: 50.0,),

               ],
             ),
           ),
        ),

      ],
    ):Center(
      child: CircularProgressIndicator(backgroundColor: Colors.red,),
    ),
  );
    });
  }
}




