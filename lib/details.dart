import 'package:flutter/material.dart';
import 'videoplayer.dart';
import 'links.dart';

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
      body: Container(
        height: 800,
        width: 800,
        color: const Color.fromARGB(255, 186, 47, 211),
        child: ListView( 
          children: <Widget>[
            Lessons(text: setLink2(goal, 1), id: 1, goals: goal), 
            Lessons(text: setLink2(goal, 2), id: 2, goals: goal),  
            Lessons(text: setLink2(goal, 3), id: 3, goals: goal),  
            Lessons(text: setLink2(goal, 4), id: 4, goals: goal),  
          ],
        ),
      ),
    );
  }
}

class Lessons extends StatelessWidget {
  final String text;
  final String goals;
  final int id; 

  const Lessons({
    super.key,
    this.text = "",
    this.goals = "", 
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final String video = setLink1(goals, id); 
    return GestureDetector(
      onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => VideoPlayerScreen(videoFile: video))
          );
      },
      child: Container(
        padding: const EdgeInsets.all(2), // Adjust the padding as needed
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 182, 65, 202), // Border color
            width: 2.0, // Border width
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
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
            // Maybe Add Pictures
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
