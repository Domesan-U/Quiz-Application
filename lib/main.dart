import 'package:flutter/material.dart';
import 'questionbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quizzler'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Quizzler(),
      )
    )
  );
}

class Quizzler extends StatefulWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  State<Quizzler> createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> scorekeeper = [];
  //final player = AudioCache();
  Q_creater creater = Q_creater();
 @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              //flex: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.baseline,
             // textBaseline: TextBaseline.alphabetic,
              children:[
                   Expanded(

                      child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 120, 20, 20),
                      child: Text(
                        creater.getquestion(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                  ),

              ],
            ),
            Expanded(flex: 1,child: Container()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('True',
                    style: TextStyle(
                    color: Colors.white,
            ),),
                  ),
                  onPressed: (){
                    setState((){
                      bool correctanswer = creater.getanswer();
                      if(correctanswer==true) {
                        creater.score();
                        scorekeeper.add(Icon(
                          Icons.check,
                          color: Colors.green,
                        ));
                      }
                      else{
                        scorekeeper.add(Icon(
                          Icons.close,
                          color: Colors.red,
                        ));
                      }
                      int flag = creater.nextquestion();
                      if(flag==1){
                        Alert(context: context, title: "Quiz", desc: "your score is ${creater.getscore()}").show();
                        scorekeeper.clear();
                      }
                  });},
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                ),
              ),],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextButton(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('False',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                  ),
                  onPressed: (){
                     setState((){
                       bool correctanswer = creater.getanswer();
                       if(correctanswer==false) {
                         creater.score();
                         scorekeeper.add(Icon(
                           Icons.check,
                           color: Colors.green,
                         ));
                       }
                       else{
                         scorekeeper.add(Icon(
                           Icons.close,
                           color: Colors.red,
                         ));
                       }
                       int flag = creater.nextquestion();
                       if(flag==1){
                         Alert(context: context, title: "Quiz", desc: "your score is ${creater.getscore()}").show();
                         scorekeeper.clear();
                       }
                     },);},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),],
            ),
            SafeArea(
              child: Row(
                children: scorekeeper,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

