// ignore_for_file: sort_child_properties_last

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiver/async.dart';

class MetronomeClass extends StatefulWidget {
  final String goals;
  final int id; 
  final List<String> exercises; 
  const MetronomeClass({super.key, required this.goals, required this.id, required this.exercises});

  @override
  createState() => MetronomeState();
}

class MetronomeState extends State<MetronomeClass> {
  static int tempo = 100;

  //Initial Style
  Color _bkgColor = Colors.red;
  final Color _txtColor = Colors.white;
  final _biggerFont = const TextStyle(fontSize: 175.0);

  bool _isPlaying = false;

  Metronome _metronome =
      Metronome.epoch(Duration(milliseconds: (60000 / tempo).round()));
  late StreamSubscription<DateTime>? _subscription;

  void _play() {
    setState(() {
      if (_isPlaying) {
        _subscription?.cancel();
        _isPlaying = false;

        _bkgColor = Colors.red;
      } else {
        _subscription =
            _metronome.listen((d) => SystemSound.play(SystemSoundType.click));
        _isPlaying = true;

        _bkgColor = Colors.green;
      }
    });
  }

  void _increaseTempo(int decrease) {
    if (!((tempo > 299 && decrease < 0) || (tempo < 41 && decrease > 0))) {
      setState(() {
        tempo -= (decrease / 4).ceil();
      });
      _metronome = Metronome.epoch(
          Duration(milliseconds: (60000 / tempo).round()));

      if (_isPlaying) {
        _subscription?.cancel();
        _subscription =
            _metronome.listen((d) => SystemSound.play(SystemSoundType.click));
      }
    }
  }

  void _showDirectionsPopup(BuildContext context, List<String> directions) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Practice'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6, // Adjust the height as needed
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (String direction in directions)
                    Text(direction),
                ],
              ),
            ),
          ),
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

void _changeBPM(BuildContext context) {
  // Define a controller for the TextFormField
  final bpmController = TextEditingController();

  // Define a global key for the form
  final formKey = GlobalKey<FormState>();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Center(child: Text('Change BPM')),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: bpmController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              final number = int.tryParse(value);
              if (number != null && number >= 30 && number <= 300) {
                setState(() {
                  tempo = number;
                  _metronome = Metronome.epoch(Duration(milliseconds: (60000 / tempo).round()));

                  if (_isPlaying) {
                    _subscription?.cancel();
                    _subscription = _metronome.listen((d) => SystemSound.play(SystemSoundType.click));
                  }
                });
              }
            },
            validator: (value) {
              final number = int.tryParse(value!);
              if (number == null || number < 30 || number > 300) {
                return 'Please enter a number between 30 and 300';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Enter BPM between 30 and 300',
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.of(context).pop(); // Close the dialog
              }
            },
            child: const Text('OK'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      );
    },
  );
}


  @override
  void dispose() {
    // Cancel the subscription and stop the metronome when the widget is disposed
    _subscription?.cancel();
    _metronome.drain();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metronome',
      home: Scaffold(
          appBar: AppBar(
          centerTitle: true,
          backgroundColor: _txtColor,
          title: const Text("Description"),
          leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // This will pop the current screen and go back
          },
        ),
          actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              // Handle menu item selection
              if (result == 'Directions') {
                // Open the popup page with directions
                _showDirectionsPopup(context, widget.exercises);
              }
              if (result == 'BPM') {
                // Open the popup page with directions
                _changeBPM(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'Directions',
                child: Text('Show Directions'),
              ),
              const PopupMenuItem<String>(
                value: 'BPM',
                child: Text('Change Beats Per Minute'),
              ),             
            ],
            
          ),
        ],
        ),
          //Red or green depending on the state of playing
          backgroundColor: _bkgColor,
          body: GestureDetector(
            //Increase or decrease tempo based on swipe direction
            onVerticalDragUpdate: (DragUpdateDetails updateDetails) {
              _increaseTempo((updateDetails.primaryDelta! / 6).floor());
            },
            onHorizontalDragUpdate: (DragUpdateDetails updateDetails) {
              _increaseTempo((updateDetails.primaryDelta! / 6).floor());
            },

            //SizedBox.expand means the button takes up the entire screen
            child: SizedBox.expand(
              child: TextButton(
                child: Text(
                  "$tempo",
                  style: _biggerFont,
                ),

                //White
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(_txtColor),
                ),

                //Plays or pauses the metronome
                onPressed: () {
                  _play();
                },
              ),
            ),
          )),
    );
  }
}