import 'package:flutter/material.dart';
// import 'package:foodbite/upi_payment.dart';
// import 'package:foodbite/netbanking_payment.dart';
// import 'package:foodbite/card_payment.dart';

class Recharge extends StatelessWidget {
  final void Function(double) onRecharge;

  const Recharge({super.key, required this.onRecharge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Options'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          PaymentOption(
            title: 'UPI',
            icon: Icons.payment,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => UpiPayment(
              //       onSuccessfulPayment: (amount) {
              //         onRecharge(amount);
              //         Navigator.pop(context);
              //       },
              //     ),
              //   ),
              // );
            },
          ),
          PaymentOption(
            title: 'Netbanking',
            icon: Icons.account_balance,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => NetbankingPayment(
              //       onSuccessfulPayment: (amount) {
              //         onRecharge(amount);
              //         Navigator.pop(context);
              //       },
              //     ),
              //   ),
              // );
            },
          ),
          PaymentOption(
            title: 'Cards',
            icon: Icons.credit_card,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => CardPayment(
              //       onSuccessfulPayment: (amount) {
              //         onRecharge(amount);
              //         Navigator.pop(context);
              //       },
              //     ),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const PaymentOption({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}