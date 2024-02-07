import 'package:flutter/material.dart';
import 'details.dart';

int option = 0;

List goals = ["icons/sing.png", "icons/speech.png", "icons/feminine.png", "icons/masculine.png"];

class MyPadding extends StatelessWidget {
  final String text;

  const MyPadding({
    super.key,
    this.text = "",
  });
  
  @override
  Widget build(BuildContext context) { 
    if (text == "Singing") {
      option = 0;
    } else if (text == "Speech") {
      option = 1;
    } else if (text == "Feminine") {
      option = 2;
    } else if (text == "Masculine") {
      option = 3;
    } else { throw ArgumentError("Incorrect Text"); }

    return GestureDetector(
      onTap: () {
        if (text == "Singing") {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsScreen(goal: "Singing")),
        );
        } else if (text == "Speech") {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsScreen(goal: "Speech")),
        );
        } else if (text == "Feminine") {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsScreen(goal: "Feminine")),
        );
        } else if (text == "Masculine") {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailsScreen(goal: "Masculine")),
        );
        } else { throw ArgumentError("Incorrect Text"); }
      },
      
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Stack(
          children: [
            Container(
              height: 200,
              color: const Color.fromARGB(255, 182, 65, 202),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Positioned (
              bottom: 10,
              right: 0,
              child: Image.asset(
                goals[option],
                width: 200,
                height: 180,
              )
            )
          ],
        ),
      ),  
    );
  }
}

