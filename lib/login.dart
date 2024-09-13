import 'package:flutter/material.dart';
import 'package:foodbite/dashboard.dart';
import 'package:foodbite/register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff7d2fd0), Color(0xff972ec6)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'img/foodlogo.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(height: 30),

              // Login Text
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, fontFamily: "Crimson"
                ),
              ),
              const SizedBox(height: 30),

              // Username Field
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: Colors.black),
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.black,fontFamily: "Crimson"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password Field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.black),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.black,fontFamily: "Crimson"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  if (_usernameController.text == "user" &&
                      _passwordController.text == "pass") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Dashboard()),
                    );
                  }
                  else if(_usernameController.text.isEmpty &&
                      _passwordController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter username and password'),
                        ),
                    );
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid username or password'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "Crimson"),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'or',
                style: TextStyle(color: Colors.black, fontSize: 16,fontFamily: "Crimson"),
              ),
              const SizedBox(height: 20),

              // Register Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "Crimson"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
