



import 'package:class_11_pcb/bloc/listdetailbloc/bloc.dart';
import 'package:class_11_pcb/bloc/listdetailbloc/listdetail_bloc.dart';
import 'package:class_11_pcb/database/quiz_db.dart';
import 'package:class_11_pcb/pages/quiz_page.dart';
import 'package:class_11_pcb/pages/testPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListdetailBloc,ListdetailState>(builder: (context,state){
      Widget bodyWidget;
      if(state is AppStartedState){

       bodyWidget= ListPage(state.chapter);
      }
      if(state is ItemSelectedState){
        bodyWidget= ChapterDetail(htmlData: state.htmlData,unit: state.unit,);
      }
      if(state is PhysicsState  ){
        bodyWidget=ListPage(state.chapter);
      }
      if(state is BiologyState){
        bodyWidget=ListPage(state.chapter);
      }



      return MaterialApp(
        home: bodyWidget !=null ? bodyWidget:Scaffold(
          body: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(backgroundColor: Colors.red,),
                  Text('Loading..',style: TextStyle(color: Colors.black,fontSize: 20.0),)
                ],
              ),
            ),
          ),
        ),

      );
    });
  }
}


class ListPage extends StatefulWidget {
  List<String>chapter;

  ListPage(this.chapter);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    ListdetailBloc listdetailBloc=BlocProvider.of<ListdetailBloc>(context,listen: false);
    GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey<ScaffoldState>();

    return MaterialApp(


      home:
        Scaffold(
          appBar: AppBar(title: Text('BOOKS',style: TextStyle(color: Colors.deepPurple),),centerTitle:true,backgroundColor: Colors.white,elevation: 0.0,

            actions: [Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(icon: Icon(Icons.search,color: Colors.black,size: 40.0,), onPressed:null),
            )],
          ),

          body: Column(
            children: [
              SizedBox(height: 5.0,),
              Container(height:290,
                child: Column(
                  children: [
                    Expanded(child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        GestureDetector(
                          onTap: (){
                            listdetailBloc.add(PhysicsChapterSelected());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 10.0,bottom: 10.0),
                            child: Container(height:230,width: MediaQuery.of(context).size.width*0.8,
                            child: Stack(children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(60.0),
                                  child: Image.asset('assets/phys.jpg',height: 200,width: MediaQuery.of(context).size.width*0.78,)),
                              Padding(
                                padding: EdgeInsets.only(top:150,left:25.0),
                                child: Text('Physics',style: TextStyle(fontSize:30.0,color: Colors.white),),
                              ),
                            ],),
                            // decoration: BoxDecoration(color:Colors.blue,borderRadius: BorderRadius.circular(30.0) ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 10.0,bottom: 10.0),
                          child: Container(height:230,width: MediaQuery.of(context).size.width*0.8,
                            child: Stack(children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(60.0),
                                  child: Image.asset('assets/chem.jpg',height: 200,width: MediaQuery.of(context).size.width*0.78,)),
                              Padding(
                                padding: EdgeInsets.only(top:150,left:10.0),
                                child: Text('Chemistry(maintaining)',style: TextStyle(fontSize:30.0),),
                              ),
                            ],),
                            // decoration: BoxDecoration(color:Colors.blue,borderRadius: BorderRadius.circular(30.0) ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            listdetailBloc.add(BiologyChapterSelected());
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 10.0,bottom: 10.0),
                            child: Container(height:230,width: MediaQuery.of(context).size.width*0.8,
                              child: Stack(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(60.0),
                                    child: Image.asset('assets/bio.jpg',height: 200,width: MediaQuery.of(context).size.width*0.78,)),
                                Padding(
                                  padding: EdgeInsets.only(top:150,left:30.0),
                                  child: Text('Biology',style: TextStyle(fontSize:30.0,color: Colors.white),),
                                ),
                              ],),
                              // decoration: BoxDecoration(color:Colors.blue,borderRadius: BorderRadius.circular(30.0) ),
                            ),
                          ),
                        ),


                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizPage()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0,left: 20.0,right: 10.0,bottom: 10.0),
                            child: Container(height:230,width: MediaQuery.of(context).size.width*0.8,
                              child: Stack(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(60.0),
                                    child: Image.asset('assets/quiz.jpg',height: 200,width: MediaQuery.of(context).size.width*0.78,)),
                                Padding(
                                  padding: EdgeInsets.only(top:150,left:10.0),
                                  child: Text('Quiz',style: TextStyle(fontSize:30.0,color: Colors.black),),
                                ),
                              ],),
                              // decoration: BoxDecoration(color:Colors.blue,borderRadius: BorderRadius.circular(30.0) ),
                            ),
                          ),
                        ),


                      ],
                    ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(height: 60.0,child: Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Text('Chapters',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w500,color: Colors.purple),)
                      ],
                    ),),
                  ],
                ),

              ),
              SizedBox(height: 10.0,),
              Expanded(child: ListView.builder(itemCount:widget.chapter.length,itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    listdetailBloc.add(ListItemSelected(unitName: widget.chapter[index]));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                    child: Container(
                      padding: EdgeInsets.only(top:10.0,left: 25.0),
                      child:Text(widget.chapter[index],style: TextStyle(
                        fontSize: 25.0,color: Colors.white
                      ),),
                      margin: EdgeInsets.only(bottom: 10.0),
                      height: 50.0,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0,
                    ),
                    color: Colors.green),
                    ),

                  ),
                );
              }))
            ],
          ),

        ),
      );

  }
}




class ChapterDetail extends StatefulWidget {
  String htmlData,unit;
  ChapterDetail({this.htmlData,this.unit});
  @override
  _ChapterDetailState createState() => _ChapterDetailState();
}

class _ChapterDetailState extends State<ChapterDetail> {
  @override
  Widget build(BuildContext context) {
    ListdetailBloc listdetailBloc=BlocProvider.of<ListdetailBloc>(context,listen: false);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(widget.unit!=null?widget.unit:"Notes"),actions: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed:(){
            listdetailBloc.add(AppStartedEvent());
          })
        ],),
        body: SingleChildScrollView(
          child: Html(
            data:widget.htmlData ,
          ),
        ),
      ),
    );
  }
}


