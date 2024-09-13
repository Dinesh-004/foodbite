import 'package:flutter/material.dart';

class UpiPayment extends StatelessWidget {
  final void Function(double) onSuccessfulPayment;

  const UpiPayment({super.key, required this.onSuccessfulPayment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UPI Payment'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulate payment
            double amount = 50.0; // Example amount
            onSuccessfulPayment(amount);
          },
          child: const Text('Pay with UPI'),
        ),
      ),
    );
  }
}