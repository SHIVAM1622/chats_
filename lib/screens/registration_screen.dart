
import 'package:flutter/material.dart';
import './components/roundedbutton.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
class RegistrationScreen extends StatefulWidget {
  
   static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}


class _RegistrationScreenState extends State<RegistrationScreen> {
     
   FirebaseAuth auth = FirebaseAuth.instance;
     
   var email,pass;
    
    creatingaccount() async{
      
    final  newuser = await  auth.createUserWithEmailAndPassword(email: email,password: pass);
       
      if (newuser != null){
         Navigator.pushNamed(context, ChatScreen.id);
      }
    } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration: kTextfielddecoration.copyWith(hintText: "enter email")
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(),
              onChanged: (value) {
                //Do something with the user input.
                pass = value;
              },
              decoration: kTextfielddecoration.copyWith(hintText: 'enter password')
            ),
            SizedBox(
              height: 24.0,
            ),
            Roudedbutton(
              colour: Colors.redAccent,
              title: 'registration',
              onpressed: (){
                 creatingaccount();
                 
                
              },
            )
          ],
        ),
      ),
    );
  }
}
