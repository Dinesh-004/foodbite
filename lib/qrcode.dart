import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Order QR Code'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // QrImage(
            //   data: orderDetails,
            //   size: 200.0,
            // ),
            SizedBox(height: 20),
            Text(
              'Scan this QR code to view your food order details.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}