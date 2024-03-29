import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flash_chat/components/roundbutton.dart';

class WelcomeScreen extends StatefulWidget {

  static const String id='welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation animation;

  @override
  void initState(){
    super.initState();
    controller=AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
      upperBound: 1
    );
//    animation=CurvedAnimation(parent: controller,curve: Curves.decelerate);
    animation=ColorTween(begin: Colors.blueGrey,end: Colors.white).animate(controller);
    controller.forward();
    //controller.reverse(from:1)
//    animation.addStatusListener((status){
//      if(status==AnimationStatus.completed){
//        controller.reverse(from: 1.0);
//      }
//      else if(status==AnimationStatus.dismissed){
//        controller.forward();
//      }
//    });

    controller.addListener((){
      setState(() {
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text:['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton('Log In',Colors.lightBlueAccent,() {
    Navigator.pushNamed(context,LoginScreen.id);
    }),
            RoundButton('Register',Colors.blueAccent,() {
    Navigator.pushNamed(context,RegistrationScreen.id);
    }),
          ],
        ),
      ),
    );
  }
}

