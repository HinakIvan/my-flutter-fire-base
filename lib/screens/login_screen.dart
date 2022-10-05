import 'package:chat_fire_base/components/rounded_button.dart';
import 'package:chat_fire_base/constants.dart';
import 'package:chat_fire_base/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id="login screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth=FirebaseAuth.instance;
  bool showSpinner = false;
 late String email;
 late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200.0,
                child: Image.asset('images/cartoon-lightning-bolt-symbol-hand-drawn-illustration-retro-style-vector-available-37012524.jpg'),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(textAlign: TextAlign.center,keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {email= value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(textAlign: TextAlign.center,obscureText: true,
                onChanged: (value) {password=value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(color: Colors.lightBlue,
                  title: 'Log in',
                  onPressed: ()async{ setState ((){
                    showSpinner=true;
                  });try{
                final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
              if (user!=null){
                Navigator.pushNamed(context, ChatScreen.id);}
                  setState((){
                    showSpinner=false;
                  });}
              catch (e){print(e);};
              }
              ),
            ],
          ),
        ),
      ),
    );
  }
}