import 'dart:math';

String setLink2(String goal, int index) {
  dynamic link2;
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

List<String> setLink3(String goal, int index) {
  index = index - 1;
  dynamic link3;
  if (goal == "Singing") {
    link3 = singDirectionsMap[singExcercises[index]];
  } else if (goal == "Speech") {
    link3 = speechDirections[speechExcercises[index]];
  } else if (goal == "Masculine") {
    link3 = masculineVoiceDirections[masculineVoiceExercises[index]];
  } else if (goal == "Feminine") {
    link3 = feminineVoiceDirections[feminineVoiceExercises[index]];
  }
  return link3 ?? [];
}

String getRandomTongueTwister(List<String> tongueTwisters) {
  Random random = Random();
  int randomIndex = random.nextInt(tongueTwisters.length);
  String twister = "\n${tongueTwisters[randomIndex]}";
  return twister; 
}

  List<String> tongueTwisters = [
    "Peter Piper picked a peck of pickled peppers. A peck of pickled peppers Peter Piper picked. If Peter Piper picked a peck of pickled peppers, Where’s the peck of pickled peppers Peter Piper picked?",
    "Betty Botter bought some butter But she said the butter’s bitter If I put it in my batter, it will make my batter bitter But a bit of better butter will make my batter better So ‘twas better Betty Botter bought a bit of better butter",
    "How much wood would a woodchuck chuck if a woodchuck could chuck wood? He would chuck, he would, as much as he could, and chuck as much wood As a woodchuck would if a woodchuck could chuck wood",
    "She sells seashells by the seashore. How can a clam cram in a clean cream can? I scream, you scream, we all scream for ice cream.",
    "I saw Susie sitting in a shoeshine shop. Susie works in a shoeshine shop. Where she shines she sits, and where she sits she shines.",
    "Fuzzy Wuzzy was a bear. Fuzzy Wuzzy had no hair. Fuzzy Wuzzy wasn’t fuzzy, was he?",
    "Can you can a can as a canner can can a can?",
    "I have got a date at a quarter to eight; I’ll see you at the gate, so don’t be late.",
    "You know New York, you need New York, you know you need unique New York.",
    "I saw a kitten eating chicken in the kitchen.",
    "If a dog chews shoes, whose shoes does he choose?",
    "I thought I thought of thinking of thanking you.",
    "I wish to wash my Irish wristwatch.",
    "Near an ear, a nearer ear, a nearly eerie ear.",
    "Eddie edited it.",
    "Willie’s really weary.",
    "A big black bear sat on a big black rug.",
    "Tom threw Tim three thumbtacks.",
    "He threw three free throws.",
    "Nine nice night nurses nursing nicely.",
    "So, this is the sushi chef.",
    "Four fine fresh fish for you.",
    "Wayne went to Wales to watch walruses.",
    "Six sticky skeletons. (x3)",
    "Which witch is which? (x3)",
    "Snap crackle pop. (x3)",
    "Flash message. (x3)",
    "Red Buick, blue Buick. (x3)",
    "Red lorry, yellow lorry. (x3)",
    "Thin sticks, thick bricks. (x3)",
    "Stupid superstition. (x3)",
    "Eleven benevolent elephants. (x3)",
    "Two tried and true tridents. (x3)",
    "Rolling red wagons. (x3)",
    "Black back bat. (x3)",
    "She sees cheese. (x3)",
    "Truly rural. (x3)",
    "Good blood, bad blood. (x3)",
    "Pre-shrunk silk shirts. (x3)",
    "Ed had edited it. (x3)",
    "We surely shall see the sun shine soon.",
    "Which wristwatches are Swiss wristwatches?",
    "Fred fed Ted bread, and Ted fed Fred bread.",
    "I slit the sheet, the sheet I slit, and on the slitted sheet I sit.",
    "A skunk sat on a stump and thunk the stump stunk, but the stump thunk the skunk stunk.",
    "Lesser leather never weathered wetter weather better."
  ];

List<String> singExcercises = [
  "Vocal Warm-Ups", 
  "Breathing", 
  "Resonance", 
  "Range"
  ];

Map<String, List<String>> singDirectionsMap = {
  'Vocal Warm-Ups': [
    "Lip Trills:\n   - Relax your facial muscles.\n   - Part your lips slightly and blow air through, creating a trill-like sound.\n   - Move smoothly through your vocal range, gradually increasing the pitch.",
    
    "\nSirens:\n   - Start with a comfortable mid-range pitch.\n   - Glide smoothly up and down the scale, as if imitating a siren.\n   - Focus on maintaining a connected and controlled sound.",
    
    "\nHumming:\n   - Keep your lips closed and produce a humming sound.\n   - Explore different pitches while keeping the sound steady.\n   - Feel the vibrations in your face and chest.",
    
    "\nTongue Exercises:\n   - Perform tongue twisters or specific tongue movement exercises.\n   - Articulate each syllable clearly to engage the tongue muscles.\n   - Gradually increase speed and complexity.",
    
    "\nScales:\n   - Begin with a comfortable pitch.\n   - Ascend and descend through a scale, maintaining evenness in tone.\n   - Use different vowel sounds to vary the exercise.",
  ],
  
  'Breathing': [
    "Diaphragmatic Breathing:\n   - Inhale deeply through your nose, allowing your diaphragm to expand.\n   - Feel your abdomen rise, ensuring your chest remains relatively still.\n   - Exhale slowly through pursed lips, controlling the release of air.",
    
    "\nBreath Awareness Exercises:\n   - Sit or stand comfortably, placing a hand on your abdomen.\n   - Inhale deeply, feeling your hand rise.\n   - Exhale fully, engaging the muscles to control the release.",
    
    "\nSustained Breath Control Exercises:\n   - Inhale deeply and smoothly.\n   - Sing a note and sustain it for as long as possible.\n   - Focus on maintaining a steady pitch and controlling the breath release.",
  ],
  
  'Resonance': [
    "Open Vowel Exercises:\n   - Sustain vowels (e.g., 'ah,' 'ee,' 'oo') with an open mouth.\n   - Focus on creating a full, resonant sound.\n   - Experiment with different vowel shapes.",
    
    "\nHumming:\n   - Produce a humming sound with your mouth closed.\n   - Explore different pitches and focus on feeling vibrations in your face and head.",
    
    "\nBubbling (or Trilling):\n   - Relax the lips, jaw, and throat by blowing a stream of air through the lips.\n   - Imitate the sound that horses make to open resonators and produce a resonant sound.",
    
    "\nNG Sound Slides:\n   - Make an “ng” sound and slide from low to high pitch and back down."
    ],

  
  'Range': [
    "Scale Exercises:\n   - Begin with a comfortable pitch and ascend through the scale.\n   - Repeat the exercise, gradually expanding to higher and lower ranges.\n   - Focus on smooth transitions between registers.",
    
    "\nSirens:\n   - Start with a mid-range pitch and smoothly slide up and down the scale.\n   - Pay attention to the connection between chest and head voice.\n   - Gradually extend the range of your sirens.",
    
    "\nOctave Jumps:\n   - Jump between octaves, starting with a comfortable range.\n   - Ensure a smooth transition without straining.\n   - Gradually expand the interval of the jumps.",
  ],
};

List<String> speechExcercises = [
  "Tongue Twisters", 
  "Articulation", 
  "Breath Control", 
  "Pitch and Tone Variation"
  ];

  Map<String, List<String>> speechDirections = {
  // Tongue Twisters
  "Tongue Twisters": [
    getRandomTongueTwister(tongueTwisters),
    getRandomTongueTwister(tongueTwisters),
    getRandomTongueTwister(tongueTwisters),
  ],

  // Articulation
  "Articulation": [
    "1. Focus on enunciating each syllable clearly.",
    "2. Practice consonant and vowel sounds separately.",
    "3. Use mirror exercises to observe and refine your mouth and tongue movements.",
    "\nRepeat these phrases: ",
    "Mommy made me mash my M&Ms",
    "Ma may me ma moo I’m a MIMO",
    "Yogi Mogu yo emo yogi Mogu yo",
    "Lolly lolly lolly lolly lolly lolly law",
    "PA PHA boo boo",
    "Mabel Mabel Mabel Mabel Mabel man"
  ],

  'Breath Control': [
    "Diaphragmatic Breathing:\n   - Inhale deeply through your nose, allowing your diaphragm to expand.\n   - Feel your abdomen rise, ensuring your chest remains relatively still.\n   - Exhale slowly through pursed lips, controlling the release of air.",
    
    "\nBreath Awareness Exercises:\n   - Sit or stand comfortably, placing a hand on your abdomen.\n   - Inhale deeply, feeling your hand rise.\n   - Exhale fully, engaging the muscles to control the release.",
    
    "\nSustained Breath Control Exercises:\n   - Inhale deeply and smoothly.\n   - Sing a note and sustain it for as long as possible.\n   - Focus on maintaining a steady pitch and controlling the breath release.",
  ],
  
  // Pitch and Tone Variation
  "Pitch and Tone Variation": [
    "One Note Charlie:\n Take a deep breath in and begin speaking on whatever topic you choose until you run out of breath. It could be what is in front of you in the room, or out the window, or what you had for breakfast. Anything. Remain on the SAME note all the time.",
    "\nSee-Saw, Up-Down:\n Practice swinging between your upper and lower range.",
    "\nPitch Experiments:\n Experiment with different pitches to express various emotions and attitudes.",
    "\nChange Your Tone with Common Words:\n Practice changing your tone with common words like 'yeah', 'no', 'okay', 'right', 'hey', 'maybe', and 'please' to show different emotions and attitudes.",
    "\nSteps and Glides:\n Practice stepping up and down in pitch with words and phrases, and gliding between one pitch to another while maintaining the same sound or vowel."
  ]
};


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

Map<String, List<String>> feminineVoiceDirections = { //update
  // Head Voice
  "Head Voice": [
    "1. Focus on accessing your 'head voice,' a lighter and higher register.",
    "2. Practice scales and exercises that encourage resonance in the head.",
    "3. Aim for a clear and bright tone while maintaining comfort in the higher range.",
  ],

  // Vocal Tone
  "Vocal Tone": [
    "1. Experiment with producing a lighter and more delicate vocal tone.",
    "2. Use breath support to achieve a controlled and steady tone.",
    "3. Work on achieving a warm and inviting quality in your voice.",
  ],

  // Light Vocal Weight
  "Light Vocal Weight": [
    "1. Emphasize a light vocal weight by avoiding excessive tension.",
    "2. Practice relaxation techniques to achieve a more effortless sound.",
    "3. Focus on a gentle and smooth vocal delivery.",
  ],

  // Pitch Mimicry
  "Pitch Mimicry": [
    "1. Listen to and mimic the pitch patterns of feminine voices.",
    "2. Pay attention to intonation, inflections, and pitch variations.",
    "3. Gradually incorporate these elements into your own voice.",
  ],
};


List<String> masculineVoiceExercises = [
  "Resonance",
  "Articulation",
  "Clarity Practice",
  "Chest Voice",
];

Map<String, List<String>> masculineVoiceDirections = {
  'Resonance': [
    "Open Vowel Exercises:\n   - Sustain vowels (e.g., 'ah,' 'ee,' 'oo') with an open mouth.\n   - Focus on creating a full, resonant sound.\n   - Experiment with different vowel shapes.",
  
    "\nHumming:\n   - Produce a humming sound with your mouth closed.\n   - Explore different pitches and focus on feeling vibrations in your face and head.",
  
    "\nBubbling (or Trilling):\n   - Relax the lips, jaw, and throat by blowing a stream of air through the lips.\n   - Imitate the sound that horses make to open resonators and produce a resonant sound.",
  
    "\nNG Sound Slides:\n   - Make an “ng” sound and slide from low to high pitch and back down.\n   - Improve resonance and vocal range through this exercise.",
  ],

  "Articulation": [
    "1. Focus on enunciating each syllable clearly.",
    "2. Practice consonant and vowel sounds separately.",
    "3. Use mirror exercises to observe and refine your mouth and tongue movements.",
    "\nRepeat these phrases: ",
    "Mommy made me mash my M&Ms",
    "Ma may me ma moo I’m a MIMO",
    "Yogi Mogu yo emo yogi Mogu yo",
    "Lolly lolly lolly lolly lolly lolly law",
    "PA PHA boo boo",
    "Mabel Mabel Mabel Mabel Mabel man"
  ],

  'Clarity Practice': [ //update
    "Clear Pronunciation:\n   - Practice clear pronunciation of words and phrases.",
    "Sibilance Exercises:\n   - Focus on sibilant sounds (e.g., 's' and 'sh') for clarity.",
    "Sentence Stress:\n   - Experiment with emphasizing different words in sentences.",
  ],

  'Chest Voice': [ //update
    "Low-Range Exercises:\n   - Explore your lower vocal range with various exercises.",
    "Resonant Speech:\n   - Relax and breath with your stomach and speak with your diaphragm ",
  ],
};