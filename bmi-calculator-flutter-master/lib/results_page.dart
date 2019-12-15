import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'input_page.dart';

class ResultPage extends StatelessWidget {
  final String result,interpret,value;

  ResultPage(this.value,this.result,this.interpret);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child:ReusableCard(activeCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        result,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF24D876)
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 90.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      Text(
                        interpret,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      FlatButton(
                        child: Text(
                          'SAVE RESULT',
                        ),
                        disabledColor: inactiveCardColor,
                        padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 40.0),
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>InputPage()));
            },
            child: Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(75, 15, 0, 0),
                    height: 60.0,
                    color: Color(0xFFEB1555),
                    child: Text(
                      'RE-CALCULATE YOUR BMI',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}