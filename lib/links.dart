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

    "Note:  High note technique: many beginners usually crumble their mouth into a rectangualr shape to hit the high notes,\ntherefore, the tone comes out irritating and can strain your throat. \nWhen it's high note time, drop your jaw (practice high note exercises with dropping your jaw... \nIf you find struggle, place your index and middle finger beneath your chin so that you'll make it a habit to sing with your jaw down)"
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
  "Resonance",
];

Map<String, List<String>> feminineVoiceDirections = { //update
  // Head Voice
  'Head Voice': [
      "To use your head voice, maintain good posture, relax your throat, and allow the sound to resonate in your head.",
      "\nLight and Airy Tone:\n   - Practice producing a light, airy tone by gently engaging your head voice: 'mi mi mi mi mi'",
      "\nAscending Five-Tone Scale:\n   - Sing an ascending five-tone scale, starting from a comfortable pitch in your head voice and moving higher. Focus on maintaining clarity and control.",
      "\nLegato Head Voice Drill:\n   - Perform legato (smooth and connected) notes on a single vowel in your head voice. Emphasize a seamless transition between notes.",
      "\nHead Voice Scales with Vowel Variation:\n   - Sing an ascending or descending scale using different vowels. Pay attention to the resonance in your head voice for each vowel.",
      "\nAscending Octave Jumps:\n   - Sing an ascending octave jump, emphasizing the higher notes to strengthen your head voice. Maintain control and clarity.",
      "\nSirens with Head Resonance:\n   - Perform siren-like sounds starting from a mid-range pitch, paying attention to vibrations in your head.",
  ],

  // Vocal Tone
  "Vocal Tone": [
    "Dynamic Range Exploration:\n   - Explore a wide dynamic range, practicing both soft and loud tones to enhance expressiveness.",
    "Nasal Resonance Exercise:\n   - Experiment with nasal resonance to add character to your tone. Be mindful of balance and avoid excessive nasal sound.",
    "Breathy Tone Variation:\n   - Intentionally incorporate breathiness into your tone for a softer and intimate quality. Control the level of breathiness as needed.",
    "Emotional Inflection:\n   - Infuse your vocal tone with emotional expression. Practice conveying different emotions through your voice.",
    "Vowel Modification Drill:\n   - Experiment with modifying vowels to achieve different tonal colors. Explore the impact of vowel shapes on your overall vocal tone.",
    "Mouth Shape Awareness:\n   - Pay attention to the shape of your mouth while singing. Experiment with different shapes to influence the resonance and tone.",
  ],

  // Light Vocal Weight
// Light Vocal Weight
  "Light Vocal Weight": [
    "1. Say 'awww' as if talking to a cute puppy or kitten",
    "\n2. Raise pitch if needed",
    "\n3. Always make sure to come down to where you intend to speak to avoid strain at a high pitch",
    "\nNote: M1, the chest voice, is lower and powerful. M2, the falsetto, is higher and breathier.\n"
    "\n1. Make a light, hollow M2 sound like an owl hoot:",
    "   \n- This should be extremely relaxed and not very loud",
    "\n2. Let the pitch fall down to a speaking level:",
    "   \n- A lower pitch will be easier to transition to M1 (chest voice)",
    "\n3. Get almost imperceptibly heavier / louder:",
    "   \n- This should make you transition from M2 to M1",
    "   \n- If you don't transition, try getting heavier at a lower pitch",
    "   \n- Gradually add weight and volume to your sound",
    "\n4. Make sure you're not in M2:",
    "   \n- Slide down to the bottom of your range if you are not sure",
    "   \n- If you have a voice break on the way, then you were likely in M2",
  ],

  'Resonance': [
    '1. Whisper a word like "part" or just "whisper"',
    '\n2. Make the whisper "lower" (this sounds like pitch, but it\'s not)',
    '\n3. Make it as high as you can without straining',
    '   \n- The loudness of the whisper is how constricted it is, so make it quiet, but not completely silent',
    '\n4. Either go to resonance stepping or:',
    '   \n- Make the sound light and airy to remove constriction',
    '\n5. Go into "la", "pa" or "ya" ("ha" is more likely to encourage constriction):',
    '   \n- Clean up the sound immediately by repeating the "la"',
    '   \n- Say "pah" or "puh" a few times',
    '   \n- Go into speech',
    '\n1. Go to a goofy, low resonance, hollow sound at a medium pitch:',
    '   \n- Say a word or phrase like "one two three"',
    '   \n- You can use a yawn to get this sort of sound',
    '   \n- 150-250hz is a good range to do this in but any pitch is ok',
    '\n2. Stop pushing the resonance down, and go back to neutral:',
    '   \n- Say the same phrase / word as before',
    '   \n- This will raise the resonance naturally back to default',
    '\n3. Go even higher and say the same phrase:',
    '   \n- Make sure that if it becomes rough, to clean it up before speaking at that position',
    '\n4. Use an unvoiced exercise to get better control and then come back to this exercise to apply it',
  ],

};


List<String> masculineVoiceExercises = [
  "Resonance",
  "Articulation",
  "Clarity",
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
    "\nMommy made me mash my M&Ms",
    "\nMa may me ma moo I’m a MIMO",
    "\nYogi Mogu yo emo yogi Mogu yo",
    "\nLolly lolly lolly lolly lolly lolly law",
    "\nPA PHA boo boo",
    "\nMabel Mabel Mabel Mabel Mabel man"
  ],

  'Clarity': [ //update
    "Clear Pronunciation:\n   - Practice clear pronunciation of words and phrases.",
    "Sibilance Exercises:\n   - Focus on sibilant sounds (e.g., 's' and 'sh') for clarity.",
    "Lip Trills:\n   - Relax your facial muscles.\n   - Part your lips slightly and blow air through, creating a trill-like sound.\n   - Move smoothly through your vocal range, gradually increasing the pitch.",
    "Sentence Stress:\n   - Experiment with emphasizing different words in sentences.",
  ],

'Chest Voice': [
    "To use your chest voice, relax your body, breathe in deeply with your stomach, and speak from your diaphragm.",
    "\nStaccato Chest Voice Drill:\n   - Perform staccato notes on a single vowel, emphasizing a strong chest resonance. Increase the speed gradually, ensuring clarity and power in each note.",
    "\nChest Voice Scales with Vowel Variation:\n   - Sing a descending or ascending scale using different vowels. Pay attention to the resonance in your chest voice for each vowel, making adjustments as needed.",
    "\nMum or Bum Exercise:\n   - Sing a sustained 'mum' or 'bum' on a descending scale, emphasizing a connected and supported sound.",
    "\nVocalization:\n   - Begin with a sigh or yawn vocalization, maintaining a deep, resonant chest voice production.",
    "\nSirens with Chest Resonance:\n   - Perform siren-like sounds starting from a mid-range pitch, paying attention to vibrations in your chest.",
    "\nInterval Leaps in Chest Voice:\n   - Leap to different notes within your chest voice range, maintaining clarity and resonance.",
    "\nChest Voice Arpeggios:\n   - Sing arpeggios in your chest voice, starting at a moderate pace and gradually increasing speed.",
],
};