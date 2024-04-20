import 'package:flutter/material.dart';
import 'onpitch.dart';
import 'pitch.dart';
import 'square.dart';

const Color mainTheme = Color.fromARGB(255, 186, 47, 211);
//const Color darkTheme = Color.fromARGB(255, 30, 29, 31);

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainTheme,
        title: Text(title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: mainTheme,
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
              title: const Text('Pitch Game'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OnPitch()),
                );
              },
            ),            
          ],
        ),
      ),
    );
  }
}
