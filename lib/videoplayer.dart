import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

dynamic link2;

class VideoPlayerScreen extends StatefulWidget {
    final String goal;
    final int index;

  const VideoPlayerScreen({super.key, required this.goal, required this.index});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    dynamic link1; 

    if (widget.goal == "Singing") {
      link1 = singLinks[widget.index];
      link2 = singExcercises[widget.index];
    } else if (widget.goal == "Speech") {
      link1 = speechLinks[widget.index];
      link2 = speechExcercises[widget.index];
    } else if (widget.goal == "Masculine") {
      link1 = masculineVoiceLinks[widget.index];
      link2 = masculineVoiceExercises[widget.index];
    } else if (widget.goal == "Feminine") {
      link1 = feminineVoiceLinks[widget.index];
      link2 = feminineVoiceExercises[widget.index];
    } else { throw ArgumentError("Incorrect Index or Text"); }

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        link1,
      ),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              // Use the VideoPlayer widget to display the video.
              child: VideoPlayer(_controller),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}

List<String> singExcercises = [
  "Vocal Warm-Ups", 
  "Breathing", 
  "Resonance", 
  "Range"
  ];
  
List<String> singLinks = [
  'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4', 
  "link2",
  "link3",
  "link4"
  ]; 


List<String> speechExcercises = [
  "Tongue Twisters", 
  "Articulation", 
  "Breath Control", 
  "Pitch and Tone Variation"
  ];

List<String> speechLinks = [
  "link6",
  "link7",
  "link8",
  "link9"
  ];


List<String> feminineVoiceExercises = [
  "Breath Control and Relaxation",
  "Tone Softening Techniques",
  "Emotional Expression in Speech",
  "Articulation Practice",
];

List<String> feminineVoiceLinks = [
  "link28",
  "link29",
  "link30",
  "link31",
];


List<String> masculineVoiceExercises = [
  "Resonance",
  "Diaphragm Engagement",
  "Articulation and Clarity Practice",
  "Pitch Control Exercises",
];

List<String> masculineVoiceLinks = [
  "link21",
  "link22",
  "link23",
  "link24"
];
