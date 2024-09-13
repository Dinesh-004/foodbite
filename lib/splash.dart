import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodbite/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Wait for 5 seconds before navigating to the Login screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()), // Navigate to Login screen
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xff7d2fd0),Color(0xff972ec6)]),
        ),
      ),
        Center(child: Image.asset('img/foodlogo.png',height: 300,width: 300,)),
        ],
      ),
    );
  }
}
