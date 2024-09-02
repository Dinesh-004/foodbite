import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          NotificationItem(
            title: 'Order Update',
            message: 'Your food order has been dispatched.',
          ),
          NotificationItem(
            title: 'Wallet Recharge',
            message: 'Your wallet has been successfully recharged.',
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String message;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(title),
        subtitle: Text(message),
      ),
    );
  }
}