import 'package:flutter/material.dart';
import 'package:foodbite/authmanagement/authmanage.dart';
import 'package:foodbite/dashboard.dart';
import 'package:foodbite/forgetpass.dart';
import 'package:foodbite/signup.dart';
import 'package:get/get.dart';
import 'package:foodbite/controllers/maincontroller.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isvisible = true;
  final _signinformkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return mainController.isLoading.value
              ? Center(child: CircularProgressIndicator()) // Show loading indicator
              : Form(
                  key: _signinformkey,
                  child: ListView(
                    children: [
                      Image.asset(
                        'img/foodlogo.png',
                        height: 300,
                        width: 300,
                        color: mainController.isDarkMode.value ? Colors.white : Colors.black,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                      Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: emailcontroller,
                          cursorColor: Colors.red,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your email";
                            } else if (!RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                .hasMatch(value)) {
                              return "Please enter a valid email address";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: Text("Email"),
                            hintText: 'Enter your email',
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: TextFormField(
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter your password";
                            } else if (value.length < 6) {
                              return "Password must be at least 6 characters long";
                            }
                            return null;
                          },
                          cursorColor: Colors.red,
                          obscureText: isvisible,
                          decoration: InputDecoration(
                            label: Text(
                              "Password",
                            ),
                            hintText: 'Enter your Password',
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isvisible = !isvisible;
                                });
                              },
                              icon: Icon(
                                isvisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_signinformkey.currentState!.validate()) {
                              try {
                                await AuthManage()
                                    .login(emailcontroller.text.trim(),
                                        passwordcontroller.text.trim())
                                    .then((value) {
                                  mainController.login(emailcontroller.text,passwordcontroller.text);
                                  mainController.isLoading.value = false;
                                  Get.off(Dashboard());
                                });
                              } catch (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      "Invalid email or password",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    backgroundColor: Colors.red,
                                    closeIconColor: Colors.black,
                                  ),
                                );
                              }
                              passwordcontroller.clear();
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff7d2fd0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 50),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(ForgetPass());
                        },
                        child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          Get.to(Signup());
                        },
                        child: Text(
                          'Don\'t have an account? Sign Up',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}

// Image.asset(
//                     'img/foodlogo.png',
//                     height: 150,
//                     width: 150,
//                     color: Colors.white,
//                   ),
