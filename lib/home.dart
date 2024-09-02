import 'package:flutter/material.dart';
import 'package:foodbite/foodorder.dart';
import 'package:foodbite/addon.dart';
import 'package:foodbite/qrcode.dart';
import 'package:foodbite/recharge.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _walletAmount = 1000.0; // Example initial amount

  void _rechargeWallet(double amount) {
    setState(() {
      _walletAmount += amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Welcome Username',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Card(
              color: Colors.white,
              elevation: 3.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text("Wallet",style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.bold)),
                    ),
                    Center(
                      child: Text(
                        'Rs.${_walletAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Recharge(
                              onRecharge: _rechargeWallet,
                            ),
                          ),
                        );
                      },
                      child: Text('Recharge Wallet'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  label: Text('Scan Food'),
                  icon: Icon(Icons.qr_code_scanner),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(160, 80),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => QRCode()));
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  label: Text('Order Food'),
                  icon: Icon(Icons.restaurant_menu),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(160, 80),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Foodorder()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              label: Text('Order Addon'),
              icon: Icon(Icons.add_shopping_cart),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(180, 80),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Addon()),
                );
              },
            ),
            SizedBox(height: 20.0),
            // Announcement panel
            Card(
              color: Colors.white,
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