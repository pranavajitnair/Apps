import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'dart:async';

final _fireStore=Firestore.instance;
FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  static const id='chat-screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController=TextEditingController();
  final _auth=FirebaseAuth.instance;
  String message;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  Future<void> getCurrentUser()async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser=user;
      }
    }catch(error){
      print(error);
    }
  }

  //The function has to called every time a new message is delivered and instantaneous message delivery is not possible. This implies the next method.
  void getMessage()async {
    try {
      final messages = await _fireStore.collection('messages').getDocuments();
      for (var messages in messages.documents) {
        print(messages.data);
      }
    } catch(error){
        print(error);
      }
    }

    void messageStream()async {
    await for(var snapshot in _fireStore.collection('messages ').snapshots()){
      for(var message in snapshot.documents){
        print(message.data);
      }
    }
    }

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //getMessage();
                messageStream();
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           MessagesStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      style: TextStyle(
                        color: Colors.black
                      ),
                      onChanged: (value) {
                        message=value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _fireStore.collection('messages').add({
                        'text':message,
                        'sender':loggedInUser.email,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessagesStream extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: _fireStore.collection('messages').snapshots(),
      builder: (context,snapshot){
        if(!snapshot.hasData){
          return Center(
              child:CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              )
          );
        }
        final messages=snapshot.data.documents.reversed;
        List<MessageBubble> messagesBubbles=[];
        for(var message in messages){
          final messageText=message.data['text'];
          final messageSender=message.data['sender'];
          final messageBubble=MessageBubble(messageSender,messageText,messageSender==loggedInUser.email);
          messagesBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            children: messagesBubbles,
            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
          ),
        );
      },
    );
  }
}


class MessageBubble extends StatelessWidget {
  final String text,sender;
  final bool isMe;
  MessageBubble(this.sender,this.text,this.isMe);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end: CrossAxisAlignment.start,
        children: <Widget>[
          Text(sender,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.black54
          ),),
          Material(
            borderRadius: isMe? BorderRadius.only(topLeft: Radius.circular(30.0),bottomLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0)):
            BorderRadius.only(bottomLeft:Radius.circular(30.0),bottomRight: Radius.circular(30.0),topRight: Radius.circular(30.0) ),
            elevation: 5.0,
            color: isMe? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
              child: Text(
                text,
                style: TextStyle(
                  color: isMe? Colors.white:Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
