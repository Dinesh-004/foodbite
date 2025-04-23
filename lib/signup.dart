import 'package:flutter/material.dart';
import 'package:foodbite/authmanagement/authmanage.dart';
import 'package:foodbite/controllers/maincontroller.dart';
import 'package:foodbite/signin.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool ispass = true;
  bool iscpass = true;
  final _signupformkey = GlobalKey<FormState>();
  TextEditingController newemailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _signupformkey,
          child: ListView(
          children: [
            Stack(
              children: [
                Center(
                  child: Image.asset(
                        'img/foodlogo.png',
                        height: 300,
                        width: 300,
                        color: mainController.isDarkMode.value ? Colors.white : Colors.black,
                        colorBlendMode: BlendMode.srcIn,
                      ),
                ),
              Positioned(child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.arrow_back),
                ),
              )
              ]
            ),
            Text("Sign Up", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                controller: newemailcontroller,
                cursorColor: Colors.red,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your email";
                  }
                  else if(!RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+').hasMatch(value)){
                    return "Please enter a valid email address";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Email"),
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                controller: phonecontroller,
                cursorColor: Colors.red,
                keyboardType: TextInputType.number,
                maxLength: 10,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your phone number";
                    }
                  else if (value.length < 10 || value.length > 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Please enter a valid phone number";
                    }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Phone"),
                  hintText: 'Enter your phone number',
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                controller: newpasswordcontroller,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter your password";
                  }
                  else if(value.length < 6){
                    return "Password must be at least 6 characters long";
                  }
                  return null;
                },
                cursorColor: Colors.red,
                obscureText: ispass,
                decoration: InputDecoration(
                  label: Text("Password"),
                  hintText: 'Enter your Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: (){
                     setState(() {
                        ispass = !ispass;
                      });
                    }, 
                     icon: Icon(ispass ? Icons.visibility_off : Icons.visibility),
                      )
               ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                controller: confirmpasswordcontroller,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please confirm your password";
                  }
                  else if(value != newpasswordcontroller.text){
                    return "Passwords do not match";
                  }
                  return null;
                },
                cursorColor: Colors.red,
                obscureText: iscpass,
                decoration: InputDecoration(
                  label: Text("Confirm Password"),
                  hintText: 'Enter your Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: (){
                     setState(() {
                        iscpass = !iscpass;
                      });
                    }, 
                     icon: Icon(iscpass ? Icons.visibility_off : Icons.visibility),
                      )
               ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  if(_signupformkey.currentState!.validate()){
                    AuthManage().signUp(newemailcontroller.text.trim(), newpasswordcontroller.text.trim());
                    Get.to(Signin());
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account Created Successfully")));
                  }
                }, 
                child: Text("Sign Up", style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7d2fd0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.off(Signin());
              }, 
              child: Text('Already have an account? Sign In',textAlign: TextAlign.center,),
              )
          ],
        )
        ),
      )
    );
  }
}