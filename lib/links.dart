dynamic link1;
dynamic link2;

void setLink1(String goal, int index) {
  index = index - 1;
  if (goal == "Singing") {
    link1 = singLinks[index];
    //link2 = singExcercises[index];
  } else if (goal == "Speech") {
    link1 = speechLinks[index];
    //link2 = speechExcercises[index];
  } else if (goal == "Masculine") {
    link1 = masculineVoiceLinks[index];
    //link2 = masculineVoiceExercises[index];
  } else if (goal == "Feminine") {
    link1 = feminineVoiceLinks[index];
    //link2 = feminineVoiceExercises[index];
  } else { throw ArgumentError("Incorrect Index or Text"); }
}

String setLink2(String goal, int index) {
  index = index - 1;
  if (goal == "Singing") {
    link2 = singExcercises[index];
  } else if (goal == "Speech") {
    link2 = speechExcercises[index];
  } else if (goal == "Masculine") {
    link2 = masculineVoiceExercises[index];
  } else if (goal == "Feminine") {
    link2 = feminineVoiceExercises[index];
  } return link2; 
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
