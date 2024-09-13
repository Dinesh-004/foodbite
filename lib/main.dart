import 'package:flutter/material.dart';
import 'package:foodbite/addon.dart';
import 'package:foodbite/dashboard.dart';
import 'package:foodbite/foodorder.dart';
import 'package:foodbite/login.dart';
import 'package:foodbite/recharge.dart';
import 'package:foodbite/home.dart';
import 'package:foodbite/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Bite',
      //theme: ThemeData(fontFamily: 'Crimson'),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: const Dashboard(),
    );
  }
}