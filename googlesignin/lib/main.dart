import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

void main() => runApp(MyApp());

String email;
GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class MyApp extends StatelessWidget {

  Future<void> _handleSignIn() async {
    try {
      GoogleSignInAccount account= await _googleSignIn.signIn();
      print(account.email);
      print('signin success');
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'best',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'hi'
          ),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Text(
                'hi'
              ),
//              TextField(
//                onChanged: (value){
//                   email=value;
//                },
//              ),
              GoogleSignInButton(
                onPressed: (){
                  _handleSignIn();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}