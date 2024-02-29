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
  int amountOfSeconds = 2;
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

  late StreamSubscription<List<dynamic>> _recorderStateSubscription;

  _initialize() async {
  print("Starting recorder...");

  // Keep asking for mic permission until accepted
  while (!(await flutterFft.checkPermission())) {
    flutterFft.requestPermission();
  }

  await flutterFft.startRecorder();
  print("Recorder started...");
  setState(() => isRecording = flutterFft.getIsRecording);

  _recorderStateSubscription = flutterFft.onRecorderStateChanged.listen(
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
    timer = Timer.periodic(Duration(seconds: amountOfSeconds), (timer) {
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

  // Function to show the popup page with directions
  void _showDirectionsPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
          title: const Text('Directions'),
          content: const Text('Adjust your singing to hit the target note! Use the current note and frequency to see how close you are. '),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _changeDifficulty(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Change Difficulty'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const Text('Select a difficulty level (2-10):'),
                  const SizedBox(height: 8),
                  DropdownButton<int>(
                    value: amountOfSeconds,
                    items: List.generate(9, (index) => index + 2)
                        .map((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        })
                        .toList(),
                    onChanged: (int? value) {
                      if (value != null) {
                        setState(() {
                          amountOfSeconds = value;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Apply the selected difficulty
                    // You can perform any actions needed with the selectedDifficulty
                    print('Selected Difficulty: $amountOfSeconds seconds');
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: const Text('Apply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _recorderStateSubscription.cancel();
    timer.cancel(); // Cancel any timers
    flutterFft.stopRecorder(); // Stop any ongoing processes
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
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle menu item selection
              if (result == 'Directions') {
                // Open the popup page with directions
                _showDirectionsPopup(context);
              }
              if (result == 'Difficulty') {
                // Open the popup page with directions
                _changeDifficulty(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'Directions',
                child: Text('Show Directions'),
              ),
              const PopupMenuItem<String>(
                value: 'Difficulty',
                child: Text('Change Difficulty'),
              ),             
            ],
          ),
        ],
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
                : const Text("Not Recording", style: TextStyle(fontSize: 35)),
            isRecording
                ? Text(
                    "Required Duration: $amountOfSeconds",
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text("", style: TextStyle(fontSize: 20)),
            isRecording
                ? Text(
                    "Current note: ${note!}",
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text("Can't get note", style: TextStyle(fontSize: 35)),
            isRecording
                ? Text(
                    "Current frequency: ${frequency!.toStringAsFixed(2)}",
                    style: const TextStyle(fontSize: 20),
                  )
                : const Text("Can't get frequency", style: TextStyle(fontSize: 35)),
          ],
        ),
      ),
    );
  }
}