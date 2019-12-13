import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  var rng=new Random();
  int leftDiceNumber=1;
  int rightDiceNumber=1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(

        children: <Widget>[
          Expanded(
            //flex: 2,
            //child:Image.asset('images/dice1/.png') can also be used for Expanded class.
            child: FlatButton(
              onPressed: (){
                func();
              },
              child: Image(
                image: AssetImage('images/dice$leftDiceNumber.png'),
              ),
            ),
          ),
          Expanded(
            //flex: 1,
            child: FlatButton(
              onPressed: (){
                func();
              },
              child: Image(
                image: AssetImage('images/dice$rightDiceNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void func(){
    setState(() {
      rightDiceNumber=rng.nextInt(6)+1;
      leftDiceNumber=rng.nextInt(6)+1;
    });
  }
}


