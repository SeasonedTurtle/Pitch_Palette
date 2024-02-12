// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';

class OnPitch extends StatefulWidget {
  const OnPitch({super.key});

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<OnPitch> {
  static const List<String> notes = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  double? targetFrequency;
  String? targetNote;
  bool isRecording = false;
  bool isNoteHit = false;
  FlutterFft flutterFft = FlutterFft();
  double? frequency;
  String? note;
  int? octave;
  bool? onPitch;
  late Timer timer;
  String? previousNote = "";

  _initialize() async {
  print("Starting recorder...");

  // Keep asking for mic permission until accepted
  while (!(await flutterFft.checkPermission())) {
    flutterFft.requestPermission();
  }

  // await flutterFft.checkPermissions();
  await flutterFft.startRecorder();
  print("Recorder started...");
  setState(() => isRecording = flutterFft.getIsRecording);

  flutterFft.onRecorderStateChanged.listen(
      (data) => {
            print("Changed state, received: $data"),
            setState(
              () => {
                frequency = data[1] as double,
                note = data[2] as String,
                octave = data[5] as int,
              },
            ),
            flutterFft.setNote = note!,
            flutterFft.setFrequency = frequency!,
            flutterFft.setOctave = octave!,
            print("Octave: ${octave!.toString()}")
          },
      onError: (err) {
        print("Error: $err");
      },
      onDone: () => {print("Isdone")});
  }

  // Function to set the next target note
  void setNextTargetNote() {
    targetNote = getRandomNote();
    while (targetNote == previousNote) {
      targetNote = getRandomNote();
    }
    previousNote = targetNote;
    isNoteHit = false;
  }

  // Function to get a random note from the list
  String getRandomNote() {
    final Random random = Random();
    final int randomIndex = random.nextInt(notes.length);
    return notes[randomIndex];
  }

  // Function to start a timer to change the target note after a second
  void startTargetNoteTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (isRecording && flutterFft.getNote == targetNote) {
        setState(() {
          isNoteHit = true;
        });
        timer.cancel(); // Stop the timer after a second
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            isNoteHit = false;
            setNextTargetNote();
          });
          startTargetNoteTimer(); // Restart the timer for the new target note
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer to avoid memory leaks
    super.dispose();
  }

  @override
  void initState() {
    isRecording = flutterFft.getIsRecording;
    frequency = flutterFft.getFrequency;
    note = flutterFft.getNote;
    octave = flutterFft.getOctave;
    onPitch = flutterFft.getIsOnPitch;
    setNextTargetNote();
    startTargetNoteTimer();
    super.initState();
    _initialize();
  }


  @override
  Widget build(BuildContext context) {
    Color bodyColor = Colors.red;
    if (isRecording) {
      bodyColor = isNoteHit ? Colors.green : Colors.red;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: bodyColor,
        title: const Text("Hit The Target Pitch"),
      ),
      body: Container(
        height: 800,
        width: 800,
        color: bodyColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isRecording
                ? Text(
                    "Target Note: $targetNote",
                    style: const TextStyle(fontSize: 50),
                  )
                : const Text("Not Recording", style: TextStyle(fontSize: 20)),
            isRecording
                ? Text(
                    "Current note: ${note!}",
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text("Not Recording", style: TextStyle(fontSize: 35)),
            isRecording
                ? Text(
                    "Current frequency: ${frequency!.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text("Not Recording", style: TextStyle(fontSize: 35)),
          ],
        ),
      ),
    );
  }
}