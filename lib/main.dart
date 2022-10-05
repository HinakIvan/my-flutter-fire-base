import 'package:chat_fire_base/screens/chat_screen.dart';
import 'package:chat_fire_base/screens/login_screen.dart';
import 'package:chat_fire_base/screens/registration_screen.dart';
import 'package:chat_fire_base/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {WidgetsFlutterBinding.ensureInitialized();await Firebase.initializeApp(); runApp(FlashChat());}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     body1: TextStyle(color: Colors.black54),
      //   ),
      // ),
      initialRoute: WelcomeScreen.id ,
      routes:{ WelcomeScreen.id:(context) =>WelcomeScreen(),
        RegistrationScreen.id:(context) =>RegistrationScreen(),
        LoginScreen.id:(context) =>LoginScreen(),
        ChatScreen.id:(context) =>ChatScreen(),
      },
      home: WelcomeScreen(),
    );
  }
}

