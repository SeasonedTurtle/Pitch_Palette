import 'package:flutter/material.dart';
import 'videoplayer.dart';

// Display Containers that when clicked which have a caption giving insight to the container
// Include youtube video and a description of how to do the excercise

class DetailsScreen extends StatelessWidget {
  final String goal;
  const DetailsScreen({super.key, this.goal = ""});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 186, 47, 211),
        title: Text(goal),
      ),
      body: Center(
        child: ListView( 
          children: <Widget>[
            Lessons(text: "Excercise #1", goals: goal), 
            Lessons(text: "Excercise #2", goals: goal),  
            Lessons(text: "Excercise #3", goals: goal),  
            Lessons(text: "Excercise #4", goals: goal),  
          ],
        ),
      ),
    );
  }
}

class Lessons extends StatelessWidget {
  final String text;
  final String goals;

  const Lessons({
    super.key,
    this.text = "",
    this.goals = "",
  });


  @override
  Widget build(BuildContext context) { 
    return GestureDetector(
      onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Excercises(passage: "boom", goal: goals, excercise: text))
          );
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
            // Positioned (
            //   bottom: 10,
            //   right: 0,
            //   child: Image.asset(
            //     goals[option],
            //     width: 200,
            //     height: 180,
            //   )
            // )
          ],
        ),
      ),  
    );
  }
}

class Excercises extends StatelessWidget {
  final String passage;
  final String goal;
  final String excercise; 

  const Excercises({
    super.key,
    required this.passage,
    required this.goal,
    required this.excercise,  
  });

  @override
  Widget build(BuildContext context) { 
    
    int index = excercise.length - 1;
    String valAsString = excercise[index];
    int excerciseID = int.parse(valAsString);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 186, 47, 211),
        title: Text(link2), //dynimically change index
      ),
      body: Center(
        child: 
          Padding(
            padding: const EdgeInsets.all(10),
              child: Stack(
          children: [
              Container(
                height: 200, 
                color: const Color.fromARGB(255, 182, 65, 202),
                // Call video player widget
                child: VideoPlayerScreen(goal: goal, index: excerciseID),
              ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                child: Text(
                  passage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }
}