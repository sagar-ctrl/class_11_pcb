
import 'package:class_11_pcb/bloc/quizBloc/bloc.dart';
import 'package:class_11_pcb/helper%20class/Question.dart';
import 'package:class_11_pcb/pages/widgets/answers.dart';
import 'package:class_11_pcb/pages/widgets/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizCollection extends StatefulWidget {
  String name;

  QuizCollection({this.name="physics"});

  @override
  _QuizCollectionState createState() => _QuizCollectionState();
}

class _QuizCollectionState extends State<QuizCollection> {
  int n=0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar:AppBar(

        elevation: 10.0,
        title:Text(widget.name.toUpperCase()),backgroundColor: Color(0xFF2c4058),),
      body: BlocProvider<QuizBloc>(create: (context)=>QuizBloc()..add(SubjectSelected(name: widget.name)),
      child: BlocBuilder<QuizBloc,QuizState>(
        builder: (context,state){
          if(state is QuizLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is SubjectSelectedState){
            n=state.n;
          }
          return Stack(
            children: [
              Container(color: Color(0xFF242A40),),
              ListView.builder(
                  itemCount: n,
                  itemBuilder: (context,index){
                     return ListTile(title: Text('Chapter ${index+1}',style: TextStyle(fontSize: 20.0),),onTap: (){
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>QuizQuestionPage(n: index,name: widget.name,)));

                     },);
              })
            ],
          );

        },
      ),

      )

    );
  }
}


class QuizQuestionPage extends StatefulWidget {
  int n;
  String name;

  QuizQuestionPage({this.n,this.name});

  @override
  _QuizQuestionPageState createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {

  int n=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: BlocProvider<QuizBloc>(
        create: (_)=>QuizBloc()..add(ChapterSelected(n:widget.n,name: widget.name)),
        child: BlocBuilder<QuizBloc,QuizState>(
          builder: (context,state){
            if(state is QuizLoadingState){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            
            if(state is ChapterSelectedState){
                
              return Scaffold(
                body:Stack(
                  children: [
                    Container(
                      color: Color(0xFFECDCDC),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                    ),
                    CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          elevation: 0.0,
                          brightness: Brightness.dark,
                          backgroundColor: Color(0xFFA25BD9),
                          actions: [
                            TextButton(onPressed: (){
                              print(n);
                              setState((){
                                
                                if(n<15){
                                  n++;
                                }
                              });
                            }, child:Text('Next',style: TextStyle(color: Colors.white,fontSize: 19.0),)),
                          ],
                          leading: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: (){
                            setState(() {
                                      if(n==0){
                                         print(n);
                                      }else{
                                        n--;
                                      }
                                                        });
                          },),
                          
                          ),

                          SliverToBoxAdapter(
                            child: Container(height: 200,
                           
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(35.0),
                            bottomRight: Radius.circular(35.0),
                          ),
                          color: Color(0xFFA25BD9),
                          ),
                            ),
                          )

                          
                      ],
                    ),
                   
                   QuestionContainer(state.questions[n]['title'], n),
                   Answers(state.questions[n],this),

                  ],
                ),
              );
            }

            return Scaffold(
              appBar: AppBar(),
            );
          },
        ),

      ),
      );

  }
}
