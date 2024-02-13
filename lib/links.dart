dynamic link2;

String setLink1(String goal, int index) {
  dynamic link1;
  index = index - 1;
  if (goal == "Singing") {
    link1 = singLinks[index];
  } else if (goal == "Speech") {
    link1 = speechLinks[index];
  } else if (goal == "Masculine") {
    link1 = masculineVoiceLinks[index];
  } else if (goal == "Feminine") {
    link1 = feminineVoiceLinks[index];
  }
  return link1;
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
  "videos/5MINUTEVOCALWARMUP.mp4", 
  "videos/BreathingWorkoutForSingers.mp4",
  "videos/RANGEEXTENSIONVOCALEXERCISE.mp4",
  "videos/RESONANCEVOCALEXERCISE.mp4"
  ]; 


List<String> speechExcercises = [
  "Tongue Twisters", 
  "Articulation", 
  "Breath Control", 
  "Pitch and Tone Variation"
  ];

List<String> speechLinks = [
  "https://www.youtube.com/watch?v=qjm53hzsKPw",
  "https://www.youtube.com/watch?v=kTay3fv6DW4",
  "https://www.youtube.com/watch?v=d67Kf9UZYZA",
  "https://www.youtube.com/watch?v=D21pN7KQlcg"
  ];

List<String> feminineVoiceExercises = [
  "Head Voice",
  "Vocal Tone",
  "Light Vocal Weight",
  "Pitch Mimicry",
];

List<String> feminineVoiceLinks = [
  "https://www.youtube.com/watch?v=sOoZvtJEC-0",
  "https://www.youtube.com/watch?v=iMO6fQJKwnc",
  "https://www.youtube.com/watch?v=F6Kbi6M5vec",
  "https://www.youtube.com/watch?v=D21pN7KQlcg&t=1s",
];


List<String> masculineVoiceExercises = [
  "Resonance",
  "Articulation",
  "Clarity Practice",
  "Chest Voice",
];

List<String> masculineVoiceLinks = [
  "https://www.youtube.com/watch?v=lxjXoopvcRQ&list=PLjumkJUG-60JDF5DK9MH96jwcM6zNCvD0&index=4",
  "https://www.youtube.com/watch?v=3Qjr9nWh5cU",
  "https://www.youtube.com/watch?v=kTay3fv6DW4&t=1s",
  "https://www.youtube.com/watch?v=CVUZeh8bhPc",
];