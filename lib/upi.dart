import 'package:flutter/material.dart';

class UpiPayment extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Pay with UPI'),
        ),
      ),
    );
  }
}