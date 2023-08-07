// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'quizEng.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class QuizPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // ignore: non_constant_identifier_names
  List<Icon> Score = [];

  quizEng quiz = quizEng();
late bool res;
 late bool ans;
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
         Expanded(
          flex: 5,
          child: Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
               quiz.getQuestion(),
                textAlign: TextAlign.center,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextButton(
    style: TextButton.styleFrom(
    backgroundColor: Colors.green,
    ),
              child: const Text(
                'True',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                ans = quiz.getAns();

                setState(() {
                  if(ans==true){

                   // ignore: prefer_const_constructors
                   Score.add( Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  }
                  else{
                    // ignore: prefer_const_constructors
                    Score.add( Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }

                  res = quiz.quesFinished();
                  if(res==true){

                    quiz.quesReset();
                    Alert(context: context, title: "FINISHED", desc: "QUIZ COMPLETE").show();
                    Score = [];
                  }
                  quiz.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextButton(

              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(

                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                ans = quiz.getAns();
            
                setState(() {
                  if(ans==false){
                    print("..");
                    // ignore: prefer_const_constructors
                    Score.add( Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  }
                  else{
                    // ignore: prefer_const_constructors
                    Score.add( Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  }

                  res = quiz.quesFinished();

                  if(res==true){

                    quiz.quesReset();
                    Score = [];
                    Alert(context: context, title: "FINISHED", desc: "QUIZ COMPLETE").show();
                  }
                  quiz.nextQuestion();
                });
              },
            ),
          ),
        ),
     Row(
       children: Score,
     )
      ],

    );
  }
}