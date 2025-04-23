import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodbite/controllers/maincontroller.dart';
import 'package:foodbite/dashboard.dart';
import 'package:foodbite/signin.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key, required this.onSplashComplete});
  final VoidCallback onSplashComplete;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), onSplashComplete);
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
