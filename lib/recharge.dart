import 'package:flutter/material.dart';
import 'package:foodbite/upi.dart';

class Recharge extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff7d2fd0), Color(0xff972ec6)],
            ),
          ),
        ),
        title: const Text('Payment Options',style: TextStyle(fontWeight: FontWeight.bold),),
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          PaymentOption(
            title: 'UPI',
            icon: Icons.payment,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpiPayment(),
                ),
              );
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