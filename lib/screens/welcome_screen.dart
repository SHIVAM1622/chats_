import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

import './components/roundedbutton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
   

    controller = AnimationController(
      duration: Duration(seconds: 3),
      upperBound: 1.0,
      vsync: this,
    );
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      backgroundColor: Colors.grey.withOpacity(controller.value),
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
                    height: controller.value *50,
                  ),
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Roudedbutton(
              title: 'Log_In',
              colour: Colors.lightBlueAccent,
              onpressed: (){
                 Navigator.pushNamed(context,  LoginScreen.id);
              }
             ),
             Roudedbutton( 
               title: "Registration",
               colour: Colors.orange,
               onpressed: (){
                   Navigator.pushNamed(context, RegistrationScreen.id);
               },
             )
           
          ],
        ),
      ),
    );
  }
}


