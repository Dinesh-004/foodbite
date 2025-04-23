import 'package:flutter/material.dart';
import 'package:foodbite/controllers/maincontroller.dart';
import 'package:foodbite/foodorder.dart';
import 'package:foodbite/addon.dart';
import 'package:foodbite/qrcode.dart';
import 'package:foodbite/recharge.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() {
            return Text(
              'Welcome, ${mainController.userEmail.value.split('@')[0].replaceAll(RegExp(r'[0-9]'), '').capitalize}',
              style: TextStyle(
                //color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            );
            }),
            const SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff7d2fd0), Color(0xff972ec6)],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text("Wallet",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                    ),
                    Center(
                      child: Obx(() {
                      return Text(
                        'Rs.${mainController.wallet.value.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                      }),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Recharge()
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      child: const Text('Recharge Now',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  label: const Text('Show QR',style: TextStyle(color: Colors.white)),
                  icon: const Icon(Icons.qr_code_scanner,color: Colors.white,),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 60),
                    backgroundColor: Colors.black,
                    shadowColor: Colors.purple,
                    side: const BorderSide(color: Colors.purple,width: 2),
                    elevation: 5,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QRCode()));
                  },
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  label: const Text('Order Food',style: TextStyle(color: Colors.white)),
                  icon: const Icon(Icons.restaurant_menu,color: Colors.white,),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(100, 60),
                    backgroundColor: Colors.black,
                    shadowColor: Colors.purple,
                    side: const BorderSide(color: Colors.purple,width: 2),
                    elevation: 5,
                    overlayColor: Colors.purple
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Foodorder()),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Flex(
              direction: axisDirectionToAxis(AxisDirection.down),
              children: [
                ElevatedButton.icon(
                label: const Text('Order Addon',style: TextStyle(color: Colors.white)),
                icon: const Icon(Icons.add_shopping_cart,color: Colors.white,),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(100, 60),
                  backgroundColor: Colors.black,
                  shadowColor: Colors.purple,
                  side: const BorderSide(color: Colors.purple,width: 2),
                  elevation: 5,
                  overlayColor: Colors.purple
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Addon()),
                  );
                },
              ),],
            ),
            const SizedBox(height: 20.0),
            // Announcement panel
            const Card(
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Announcements',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Announcements...',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}