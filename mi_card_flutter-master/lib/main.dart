import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            //verticalDirection: VerticalDirection.up,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 200.0,
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('images/ic_launcher.png'),
              ),
              Text(
                'Pranav Ajit Nair',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: Divider(
                  color: Colors.teal.shade100,
                ),
                height: 20.0,
                width: 150.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal.shade900,
                      size: 30,
                    ),
                    title: Text(
                      '+919966098034',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                color: Colors.white,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal.shade900,
                      size: 30,
                    ),
                    title: Text(
                      'pranavn1008@gmail.com',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Sans Pro',
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Container(
//color: Colors.white,
//child: Text('hello'),
//height: 100.0,
//width: 100.0,
////margin: EdgeInsets.fromLTRB(10, 20, 30, 50),
////padding: EdgeInsets.all(20.0),
//),
//SizedBox(
////leave space between two containers
//height:20,
//),
//Container(
//child: Text('hello world!'),
//height: 100.0,
//width: 500.0,
//color: Colors.blue,
////                margin: EdgeInsets.fromLTRB(10, 20, 30, 50),
////                padding: EdgeInsets.all(20.0),
//),
//Container(
//child: Text('hello world!'),
//height: 100.0,
//width: 100.0,
////for infinite double.infinity to push all children to the right
//color: Colors.blue,
////                margin: EdgeInsets.fromLTRB(10, 20, 30, 50),
////                padding: EdgeInsets.all(20.0),
//)
