import 'package:flutter/material.dart';
import 'package:foodbite/register.dart';
import 'package:foodbite/dashboard.dart';
import 'dart:ui';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

final TextStyle customFont = TextStyle(
  fontFamily: 'CustomFont',
);

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffef5e5e),
                Color(0xffec845a),
              ]),
        ),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 150),
            Container(
              height: 340,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'customFont',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: customFont,
                        icon: Icon(Icons.person),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: customFont,
                        icon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {
                        if (_usernameController.text == "user" &&
                            _passwordController.text == "pass") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid username or password'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // change button color here
                        foregroundColor: Colors.white, // change text color here
                        elevation: 5, // add shadow
                      ),
                      child: const Text(
                        '          Login          ',
                        style: TextStyle(
                          fontFamily: 'customfont',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "or",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'customfont',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // change button color here
                foregroundColor: Colors.white, // change text color here
                elevation: 5, // add shadow
              ),
              child: Text(
                '          Register          ',
                style: TextStyle(
                  fontFamily: 'customfont',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
