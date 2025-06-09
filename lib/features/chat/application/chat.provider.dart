// independent providers -------//

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentaura_app/features/chat/domain/emotion.response.model.dart';
import 'package:mentaura_app/features/chat/infrastructure/emotion.repository.dart';
import 'package:mentaura_app/features/chat/infrastructure/gemini.api.repository.dart';

final lastWordProvider = StateProvider<String>((ref) {
  return "";
});

final keyboardProvider = StateProvider<bool>((ref) {
  return false;
});

final micListeningProvider = StateProvider<String>((ref) {
  return "notListening";
});

// repo providers

final geminiRepositoryProvider = Provider((ref) => GeminiApiRepository());

final emotionHistoryRepositoryProvider = Provider((ref) => EmotionRepository());

final emotionDetailsNotifierProvider =
    StateNotifierProvider<EmotionDetailsNotifier, EmotionResponse>((ref) {
  return EmotionDetailsNotifier();
});

class EmotionDetailsNotifier extends StateNotifier<EmotionResponse> {
  EmotionDetailsNotifier()
      : super(EmotionResponse(
            emotion: "",
            confidence: 0,
            chatTitle: "",
            suggestedReplyTitle: "",
            suggestedReply: "",
            activityTitle: "",
            explanation: ""));

  void updateEmotionDetails(EmotionResponse newEmotion) {
    state = newEmotion;
  }
}
