

import 'package:edu_connect/screens/sign_up_user/email_log.dart';
import 'package:edu_connect/screens/sign_up_user/phone_log.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';


class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("choose sign up method"),
      ),
      body: Container(

        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("How would you like to sign up?",style: Theme.of(context).textTheme.bodyText1,),
                RaisedButton(onPressed: (){Navigator.push(context,  MaterialPageRoute(builder: (context) => EmailSignUp()),);}, child: Container(child: Text("Sign in using Email"))),
                RaisedButton(onPressed: (){Navigator.push(context,  MaterialPageRoute(builder: (context) => PhoneSignUp()),);}, child: Text("Sign in using Phone number")),
                //RaisedButton(onPressed: (){}, child: Text("Sign in using Google")),
              ],

            ),
          ),
        ),
      ),
    );
  }
}