import 'package:flutter/material.dart';
import 'package:foodbite/login.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  final TextEditingController _curpasswordController = TextEditingController();
  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff7d2fd0), Color(0xff972ec6)],
            ),
          ),
        ),
        title: const Text('Change Password',style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                  'Change Password',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, fontFamily: "Crimson"
                  ),
                ),
                const SizedBox(height: 30),

                // Username Field
                TextField(
                  controller: _curpasswordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.black),
                    labelText: 'Current Password',
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
                  controller: _newpasswordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.black),
                    labelText: 'New Password',
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
                TextField(
                  controller: _repasswordController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.black),
                    labelText: 'Re-Enter new Password',
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
                    if (_curpasswordController.text.isEmpty || _newpasswordController.text.isEmpty || _repasswordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter all fields'),
                        ),
                      );
                    }
                    else if(_curpasswordController.text == "pass" && _newpasswordController.text!=_repasswordController.text){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Re-Entered password mismatches with new password'),
                        ),
                      );
                    }
                    else if(_curpasswordController.text == "pass" && _newpasswordController.text.length<8 && _repasswordController.text.length<8){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('New Password length should be greater than 8 characters'),
                        ),
                      );
                    }
                    else if(_curpasswordController.text == "pass" && _newpasswordController.text==_repasswordController.text){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Password changed successfully'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }else if(_curpasswordController.text != "pass"){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Current Password Incorrect'),
                        ),
                      );
                    }
                    else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Invalid password'),
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
                    'Change Password',
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
                    'Back to login',
                    style: TextStyle(fontSize: 14, color: Colors.white,fontFamily: "Crimson"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
