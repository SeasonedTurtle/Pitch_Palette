// ignore_for_file: avoid_print
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';

class Pitch extends StatefulWidget {
  const Pitch({super.key});

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Pitch> {
  double? frequency;
  String? note;
  int? octave;
  bool? isRecording;
  bool? onPitch;

  FlutterFft flutterFft = FlutterFft();
  late StreamSubscription<List<dynamic>>? _recorderStateSubscription;

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
  
  Widget box(String text) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxWidthPercentage = 0.8; // Adjust this percentage as needed

    double boxWidth = screenWidth * boxWidthPercentage;

    return Container(
      width: boxWidth,
      padding: const EdgeInsets.all(2), // Adjust the padding as needed
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 182, 65, 202), // Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
      )
    );
  }

  @override
  void dispose() {
    _recorderStateSubscription?.cancel();
    super.dispose();
    flutterFft.stopRecorder(); // Stop the recorder
  }

  @override
  void initState() {
    isRecording = flutterFft.getIsRecording;
    frequency = flutterFft.getFrequency;
    note = flutterFft.getNote;
    octave = flutterFft.getOctave;
    onPitch = flutterFft.getIsOnPitch;
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 185, 35, 211),
            title: const Text("Pitch Check"), //dynimically change index
          ),
          backgroundColor: const Color.fromARGB(255, 186, 47, 211),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isRecording!
                    ? box("Note: ${note!},${octave!.toString()}")
                    : box("Not Recording"),
                const SizedBox(
                  height: 20,
                ),
                isRecording!
                    ? box("Frequency: ${frequency!.toStringAsFixed(2)}")
                    : box("Not Recording")
              ],
            ),
          ),
        );
  }
}