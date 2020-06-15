import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Firestore _firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser sender;
  FirebaseUser users;
  userdetails() async {
    currentuser = await auth.currentUser();
    if (currentuser != null) {
      sender = currentuser;
      // print(sender.email);

    }
  }
   void messageStream() async{
      await for(var snapshot in _firestore.collection('chatting').snapshots()){
            for(var message in snapshot.documents){
              print(message.data);
            }
       }
   }
  String _message;
  var currentuser;

  savingdata() async {
    await _firestore
        .collection('chatting')
        .add({'text': _message, 'sender': sender.email});
  }

  @override
  void initState() {
    super.initState();
    userdetails();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        //Do something with the user input.
                        _message = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      //Implement send functionality.
                      savingdata();
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
