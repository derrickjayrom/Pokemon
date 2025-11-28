import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text(
          'Notification',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
