import 'package:chat_fire_base/components/rounded_button.dart';
import 'package:chat_fire_base/constants.dart';
import 'package:chat_fire_base/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';


class RegistrationScreen extends StatefulWidget {
  static const String id = "registration screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth=FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(inAsyncCall:showSpinner ,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200.0,
                child: Image.asset(
                    'images/cartoon-lightning-bolt-symbol-hand-drawn-illustration-retro-style-vector-available-37012524.jpg'),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(keyboardType: TextInputType.emailAddress ,textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter you email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField( textAlign: TextAlign.center,obscureText: true,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: ' Enter your password',suffixIcon: IconButton(icon:Icon(Icons.visibility),onPressed: (){} ,))
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: "Register",
                color: Colors.blueAccent,
                onPressed: () async{ 
                  setState((){
                    showSpinner=true;
                  });
                  try{
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                if(newUser!=null){
                  Navigator.pushNamed(context,ChatScreen.id);
                }
                  setState((){
                    showSpinner=false;
                  });}
                    catch(e){print(e);}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
