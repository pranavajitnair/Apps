import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              func(Colors.red, 1),
              func(Colors.orange, 2),
              func(Colors.yellow, 3),
              func(Colors.green, 4),
              func(Colors.teal, 5),
              func(Colors.blue, 6),
              func(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }

  Expanded func(MaterialColor color, int i) {
    return (Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(0),
        child: null,
        color: color,
        onPressed: () {
          final player = AudioCache();
          player.play('note$i.wav');
        },
      ),
    ));
  }
}
