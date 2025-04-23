import 'package:flutter/material.dart';
import 'package:foodbite/controllers/maincontroller.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return Scaffold(
        body: Center(
          child: Obx(() {
              return Stack(
            children: [
              CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: mainController.imageBytes.value!=null ? MemoryImage(mainController.imageBytes.value!) : null,
              child: mainController.imageBytes.value==null
              ?Icon(Icons.person,size: 70,color: Colors.grey.shade700,)
              :null),
            Positioned(
              right: 5,
              bottom: 5,
              child: GestureDetector(
                onTap: mainController.pickImage,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.edit,color: Colors.white,size: 20,),
                ),
              ),
            ),
            ],
          );
          }),
        ),
    );
  }
}