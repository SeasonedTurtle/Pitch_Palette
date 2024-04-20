// ignore_for_file: avoid_print
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fft/flutter_fft.dart';
import 'dart:math';

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
  List<double> frequencies = [0.0, 0.0];
  FlutterFft flutterFft = FlutterFft();
  late StreamSubscription<List<dynamic>>? _recorderStateSubscription;
  //VisualizerPainter? externalData;
  
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
      onDone: () => {print("Isdone")},
    );

    //externalData = VisualizerPainter(frequencies);
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
      ),
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
    frequencies.add(frequency!);
    print(frequencies);
    double boxWidth = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 185, 35, 211),
        title: const Text("Pitch Check"), // dynamically change index
      ),
      backgroundColor: const Color.fromARGB(255, 186, 47, 211),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CustomPaint(
            //   painter: externalData, // Corrected parameter name
            //   size: Size(boxWidth, 100),
            // ),
            const SizedBox(
              height: 20,
            ),
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

// class VisualizerPainter extends CustomPainter {
//   final List<double> frequencies;

//   VisualizerPainter(this.frequencies) : super();

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = Colors.blue
//       ..strokeWidth = 2.0
//       ..strokeCap = StrokeCap.round;

//     if (frequencies.length >= 2) {
//       final double latestFrequency = frequencies[frequencies.length - 1];
//       final double secondLatestFrequency = frequencies[frequencies.length - 2];

//       // Your transformation logic here using the Fourier Transform
//       final List<Complex> transformedValues = fourierTransform([latestFrequency, secondLatestFrequency]);

//       // Use the transformed value for drawing
//       final double transformedValue = transformedValues[0].real; // Use the real part for simplicity

//       final double x = size.width / 2;
//       final double y = size.height / 2 - transformedValue;
//       final Offset start = Offset(x, size.height / 2);
//       final Offset end = Offset(x, y);

//       canvas.drawLine(start, end, paint);
//     } else {
//       print("Not enough frequencies to draw.");
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false; // We rely on external data changes to trigger repaint
//   }

//   List<Complex> fourierTransform(List<double> input) {
//     int N = input.length;
//     List<Complex> result = List.filled(N, Complex(0, 0));

//     for (int k = 0; k < N; k++) {
//       for (int n = 0; n < N; n++) {
//         double theta = -2 * pi * k * n / N;
//         result[k] += Complex.fromReal(input[n] * cos(theta), -input[n] * sin(theta));
//       }
//       result[k] /= N.toDouble();
//     }

//     return result;
//   }
// }

// class Visualizer extends StatefulWidget {
//   final List<double> frequencies;

//   const Visualizer({Key? key, required this.frequencies}) : super(key: key);

//   @override
//   _VisualizerState createState() => _VisualizerState();
// }

// class _VisualizerState extends State<Visualizer> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: VisualizerPainter(widget.frequencies),
//     );
//   }
// }

// class Complex {
//   double real;
//   double imaginary;

//   Complex(this.real, this.imaginary);

//   Complex.fromReal(double real, double d) : this(real, 0);

//   Complex operator +(Complex other) {
//     return Complex(real + other.real, imaginary + other.imaginary);
//   }

//   Complex operator /(double scalar) {
//     return Complex(real / scalar, imaginary / scalar);
//   }

//   @override
//   String toString() {
//     return '($real, $imaginary)';
//   }
// }

