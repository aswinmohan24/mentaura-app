import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mentaura_app/features/chat/application/chat.provider.dart';
import 'package:mentaura_app/features/chat/domain/emotion.history.model.dart';

final allEmotionHistoryProvider =
    FutureProvider<List<EmotionHistoryModel>>((ref) async {
  final emotionRepository = ref.watch(emotionHistoryRepositoryProvider);
  return emotionRepository.getAllEmotionHistory();
});

final emotionHistoryNotifierProvider = StateNotifierProvider<
    EmotionHistoryNotifier, AsyncValue<List<EmotionHistoryModel>>>((ref) {
  return EmotionHistoryNotifier(ref);
});

class EmotionHistoryNotifier
    extends StateNotifier<AsyncValue<List<EmotionHistoryModel>>> {
  final Ref ref;
  EmotionHistoryNotifier(this.ref) : super(const AsyncValue.loading()) {
    getAllEmotionsHistory();
  }

  void getAllEmotionsHistory() async {
    try {
      final emotionHistory = await ref
          .read(emotionHistoryRepositoryProvider)
          .getAllEmotionHistory();
      state = AsyncValue.data(emotionHistory);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void setMoodHistory(List<EmotionHistoryModel> allHistory) {
    state = AsyncValue.data(allHistory);
  }

  void addNewMoodHistory(EmotionHistoryModel newHisory) {
    final previous = state.value ?? [];
    state = AsyncValue.data([newHisory, ...previous]);
  }
}

final moodChipChangeProvider = StateProvider<String>((ref) {
  return "All";
});
