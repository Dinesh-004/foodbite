import 'package:flutter/material.dart';
import 'package:foodbite/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
                'Register',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,fontFamily: "Crimson"
                ),
              ),
              const SizedBox(height: 30),

              // Username Field
              TextField(
                controller: _usernameController, // Linked controller
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: Colors.black),
                  labelText: 'Username',
                  labelStyle: const TextStyle(color: Colors.black,fontFamily: "Crimson"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black), // Black border color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black), // Black border color when focused
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _phoneController, // Linked controller
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone, color: Colors.black),
                  labelText: 'Phone',
                  labelStyle: const TextStyle(color: Colors.black,fontFamily: "Crimson"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black), // Black border color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black), // Black border color when focused
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Password Field
              TextField(
                controller: _passwordController, // Linked controller
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.black),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.black,fontFamily: "Crimson"),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black), // Black border color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black), // Black border color when focused
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),

              // Login Button
              ElevatedButton(
                onPressed: () {
                  if (_usernameController.text.isEmpty ||
                      _passwordController.text.isEmpty ||
                      _phoneController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Enter all fields'),
                      ),
                    );
                  }
                  else if(_usernameController.text.length<4){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Username length should be atleast 4 characters'),
                      ),
                    );
                  }
                  else if(_phoneController.text.length != 10){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid phone number'),
                      ),
                    );
                  }
                  else if(_passwordController.text.length<8){
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password length should be atleast 8 characters'),
                      ),
                    );
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Register Successfully'),
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
                  'Register',
                  style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "Crimson"),
                ),
              ),
              const SizedBox(height: 20),

              // Or Text
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
                    MaterialPageRoute(builder: (context) => const Login()),
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
                  'Back to Login',
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
