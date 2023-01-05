import 'dart:async';
import 'package:delivery_boy/screen/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Login.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Splash Screen',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
    super.initState();

          _navigate();


            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => SecondScreen()))





  }
  Future<void> _navigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('ut');
    if (userToken == null) {
      print("move to login page");
      Future.delayed(Duration(milliseconds: 3000), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } else {
      print("move to home page");
      Future.delayed(Duration(milliseconds: 3000), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DashboardScreen()));
      });
    }
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavigationBars()));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Image.asset(
        "image/logo_splash.png",
      ),
    );
  }
}

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return LoginScreen();
//   }
// }
