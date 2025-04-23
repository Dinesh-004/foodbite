import 'package:flutter/material.dart';
import 'package:foodbite/authmanagement/authmanage.dart';
import 'package:foodbite/controllers/maincontroller.dart';
import 'package:foodbite/signin.dart';
import 'package:get/get.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool ispass = true;
  bool iscpass = true;
  bool isrpass = true;
  final _passformkey = GlobalKey<FormState>();
  TextEditingController currpasswordcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _passformkey,
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
            Text("Change Password", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextFormField(
                controller: currpasswordcontroller,
                validator: (value){
                  if(value!.isEmpty || mainController.userpass.value!= currpasswordcontroller.text){
                    return "Please enter your current password";
                  }
                  return null;
                },
                cursorColor: Colors.red,
                obscureText: ispass,
                decoration: InputDecoration(
                  label: Text("Current Password"),
                  hintText: 'Enter your Current Password',
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
                controller: newpasswordcontroller,
                validator: (value){
                  if(value!.isEmpty){
                    return "Please enter new password";
                  }
                  else if(value.length < 6){
                    return "Password must be at least 6 characters long";
                  }
                  else if(value == currpasswordcontroller.text || value == mainController.userpass.value){
                    return "New password cannot be same as old password";
                  }
                  return null;
                },
                cursorColor: Colors.red,
                obscureText: iscpass,
                decoration: InputDecoration(
                  label: Text("New Password"),
                  hintText: 'Enter your new Password',
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
                obscureText: isrpass,
                decoration: InputDecoration(
                  label: Text("Re-Enter Password"),
                  hintText: 'Re-Enter your new Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: (){
                     setState(() {
                        isrpass = !isrpass;
                      });
                    }, 
                     icon: Icon(isrpass ? Icons.visibility_off : Icons.visibility),
                      )
               ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: (){
                  if(_passformkey.currentState!.validate()){
                    AuthManage().changePassword(newpasswordcontroller.text).then((value) {
                      if(value == "success"){
                        mainController.userpass.value = newpasswordcontroller.text;
                        currpasswordcontroller.clear();
                        newpasswordcontroller.clear();
                        confirmpasswordcontroller.clear();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Changed Successfully")));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $value")));
                      }
                    });
                  }
                }, 
                child: Text("Submit", style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
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
                Get.offAll(Signin());
              }, 
              child: Text('Go to Sign In',textAlign: TextAlign.center,),
              )
          ],
        )
        ),
      )
    );
  }
}