import 'package:flutter/material.dart';
import 'bank.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper=[];
  int i=0,correct=0;
  Bank Q=Bank();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                Q.getQuestion(i),
                textAlign: TextAlign.center,
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
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                func(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                func(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper
        ),
    ]
    );
  }

  void func(bool value){
    if(Q.getAnswer(i)==value){
      setState(() {
        i=i+1;
        scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            )
        );
      });
    }
    else{
      setState(() {
        i+=1;
        correct+=1;
        scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            )
        );
      });
    }
    if(i==13){
      setState(() {
        Alert(context: context, title: "Quiz over!", desc:"Your score: "+correct.toString()).show();
        i=0;
        correct=0;
        scoreKeeper.clear();
      });
    }
  }
}