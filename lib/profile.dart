import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Container(
        color: Colors.purple, // Solid purple background
        child: const Center(
          child: Text(
            'This is the Profile Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
