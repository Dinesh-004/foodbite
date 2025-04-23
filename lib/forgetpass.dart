import 'package:flutter/material.dart';
import 'package:foodbite/authmanagement/authmanage.dart';
import 'package:foodbite/controllers/maincontroller.dart';
import 'package:get/get.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  TextEditingController resetpass = TextEditingController();
  final _resetformkey = GlobalKey<FormState>();
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _resetformkey,
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
              Text("Receive an email to reset your password",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
              Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                controller: resetpass,
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
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  if(_resetformkey.currentState!.validate()){
                    AuthManage().passwordreset(resetpass.text).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password reset email sent to ${resetpass.text}")));
                      Navigator.pop(context);
                    }).catchError((error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $error")));
                    });
                  }
                }, 
                child: Text("Forget Password", style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff7d2fd0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                ),
              ),
            ),
            ],
          ),
        )
        )
    );
  }
}