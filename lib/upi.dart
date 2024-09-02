import 'package:flutter/material.dart';

class UpiPayment extends StatelessWidget {
  final void Function(double) onSuccessfulPayment;

  const UpiPayment({Key? key, required this.onSuccessfulPayment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulate payment
            double amount = 50.0; // Example amount
            onSuccessfulPayment(amount);
          },
          child: Text('Pay with UPI'),
        ),
      ),
    );
  }
}