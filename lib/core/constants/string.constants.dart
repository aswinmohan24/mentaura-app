const termsAndPolicy =
    "By continuing, you agree to our\nTerms of service  Privacy Policy  Content Policy";

const otpScreenScript = "We've sent you a code to verify your \n phone number";

const loadingTextList = [
  "One breath at a time.",
  "Mood? Let’s find out!",
  "Feel. Breathe. Begin again",
  "Smiles take a second",
  "Peace is loading gently",
  "You’re in safe hands",
  "Soft start Big shift",
  "This moment is yours",
  "Calm is setting in",
  "Energy finding its flow",
  "Just feelings, no filters",
  "Let it be light",
  "Emotions have entered chat",
  "A little peace ahead",
  "Hearts loading with care"
];

const logOutSheetTitle = "Log Out of Mentaura ?";
const logOutSheetSubTitle =
    "Don’t worry, your journey is safe. Return anytime \nwhen you're ready to continue.";

const geminiMessage =
    "Analyze the following message: Yesterday my friend was died in a accident, i cant sleep after that incident, idont knwo how to igone it. Identify the primary emotion expressed from one of these: happy, surprised, neutral, sad, depressed, angry. Provide the emotion, a confidence score between 0 and 1, and a short friendly suggested reply with a title (e.g., Ohh... I think you're feeling sad). Also give different and unique activities based on detected emotion type, (eg, if detected emotion is depressed, activity title is like Dont stay alone, explantion is like Dont stay at room lonely spend time with your friends and share your emotions to you friend.) Return only a JSON with the keys: emotion, confidence, suggestedReplyTitle, and suggestedReply, activityTitle, explanation";

const geminiApiMessageTwo =
    "Analyze: 'Yesterday my friend died in an accident, I can't sleep since then. I don't know how to ignore it.' Detect one emotion: happy, surprised, neutral, sad, depressed, angry. Return JSON with: emotion, confidence (0–1), suggestedReplyTitle (e.g., 'Ohh... I think you're feeling sad'), suggestedReply, activityTitle (e.g., 'Don't stay alone'), and explanation (e.g., 'Spend time with friends and share your emotions.'). Make all outputs friendly and emotion-appropriate.";
