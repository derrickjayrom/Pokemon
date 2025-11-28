import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('User Profile'),
      ),
      body: const Center(
        child: Text(
          'User',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
