import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_yoyo/Screen/login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 197, 216, 197,)!,
          Color.fromARGB(255, 11, 56, 13,)!,
        ],
    ),
    ),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'assets/icons/logo.png',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),

    SizedBox(height: 20),
    Text(
    'Welcome to MyYoYo',
    style: TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    ),
    ),
    SizedBox(height: 10),
    Text(
    'Powered by Flutter',
    style: TextStyle(
    fontSize: 28,
    color: Colors.black,
    ),
    ),
    ],
    ),
    ),
    ),
    );
  }
}


