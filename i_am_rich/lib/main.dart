import 'package:flutter/material.dart';

//The Main function is the starting point for all oir Flutter apps.
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text('I am Rich'),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Center(child:
          Image(
            image: AssetImage('images/diamond.png'),
          ),)
        ),
      ),
    );
