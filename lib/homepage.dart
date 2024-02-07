import 'package:flutter/material.dart';
import 'package:senior_project/profile.dart';
import 'pitch.dart';
import 'square.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 186, 47, 211),
        title: Text(title),
      ),
      body: Center(
        child: ListView(
          children: const <Widget>[
            MyPadding(text: "Singing"),
            MyPadding(text: "Speech"),
            MyPadding(text: "Feminine"),
            MyPadding(text: "Masculine"),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 186, 47, 211),
              ),
              child: Text('Hello!'),
            ),
            ListTile(
              title: const Text('Pitch Check'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Pitch()),
                );
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}
