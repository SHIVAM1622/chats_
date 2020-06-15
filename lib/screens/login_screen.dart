import 'package:flash_chat/screens/components/roundedbutton.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './chat_screen.dart';

class LoginScreen extends StatefulWidget {
 
   static String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   
   var email,pass;
   FirebaseAuth _auth = FirebaseAuth.instance;
    
    loggedin() async{
     
     final  logger = await _auth.signInWithEmailAndPassword(email: email, password: pass);

     if(logger != null){
         Navigator.pushNamed(context, ChatScreen.id);
     }

    }

    


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            
            icon: Icon(Icons.arrow_left,color: Colors.black,),
          ),
        ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
                          child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email =value;
                //Do something with the user input.
              },
              decoration:kTextfielddecoration.copyWith(hintText: 'enter your email')
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
                pass  = value;
              },
              decoration: kTextfielddecoration.copyWith(hintText: "enter your password")
            ),
            SizedBox(
              height: 24.0,
            ),
       
            Roudedbutton(
              title: 'login',
              colour: Colors.lightGreenAccent,
              onpressed: (){
                loggedin();
              },
            )
          ],
        ),
      ),
    );
  }
}
