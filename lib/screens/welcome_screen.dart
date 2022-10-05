import 'package:chat_fire_base/components/rounded_button.dart';
import 'package:chat_fire_base/screens/login_screen.dart';
import 'package:chat_fire_base/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcom screen id';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          // .withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Image.asset(
                      'images/cartoon-lightning-bolt-symbol-hand-drawn-illustration-retro-style-vector-available-37012524.jpg'),
                  height: animation.value * 70,
                ),
                Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: 'Log in',
              color: Colors.lightBlue,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
           RoundedButton(color:Colors.blueAccent , title: 'Register', onPressed: (){Navigator.pushNamed(context,
               RegistrationScreen.id);}),
          ],
        ),
      ),
    );
  }
}

