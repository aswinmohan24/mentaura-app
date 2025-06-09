import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentaura_app/core/extensions.dart';
import 'package:mentaura_app/core/theme/color.palette.dart';
import 'package:mentaura_app/core/theme/text.styles.dart';
import 'package:mentaura_app/core/utils/string.utils.dart';
import 'package:mentaura_app/core/widgets/ui_components/rotating.logo.dart';
import 'package:mentaura_app/features/chat/domain/emotion.history.model.dart';
import 'package:mentaura_app/features/mood.history/application/activity.provider.dart';
import 'package:mentaura_app/features/mood.history/presentation/screens/history.details.screen.dart';
import 'package:mentaura_app/features/mood.history/presentation/widgets/history.date.widget.dart';
import '../widgets/history.time.and.mood.dart';
import '../widgets/mood.choice.chip.dart';

class MoodHistoryScreen extends ConsumerWidget {
  const MoodHistoryScreen({super.key});

  static const moodNameList = [
    "All",
    "Happy",
    "Sad",
    "Neutral",
    "Angry",
    "Surprised",
    "Depressed"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asynValue = ref.watch(emotionHistoryNotifierProvider);

    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Mood History",
                      style: CustomTextStyles.titleLargeRegular(),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    MoodChoiceChip(moodNameList: moodNameList),
                    SizedBox(
                      height: 10.h,
                    ),
                    Expanded(
                        child: asynValue.when(data: (moodHistoryList) {
                      moodHistoryList.sort((a, b) =>
                          b.createdDateTime.compareTo(a.createdDateTime));
                      final selectedMood = ref.watch(moodChipChangeProvider);

                      final sortedMoodhistoryList = moodHistoryList
                          .where((history) =>
                              history.emotion == selectedMood.toLowerCase())
                          .toList();
                      return (selectedMood == "All" && moodHistoryList.isEmpty)
                          ? Center(
                              child: Text("History is empty"),
                            )
                          : (selectedMood != "All" &&
                                  sortedMoodhistoryList.isEmpty)
                              ? Center(
                                  child: Text("History is empty.."),
                                )
                              : ListView.builder(
                                  itemCount: selectedMood == "All"
                                      ? moodHistoryList.length
                                      : sortedMoodhistoryList.length,
                                  itemBuilder: (context, index) {
                                    final moodDetails = selectedMood == "All"
                                        ? moodHistoryList[index]
                                        : sortedMoodhistoryList[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          log(moodHistoryList[index].id ??
                                              "No id");
                                          Navigator.pushNamed(context,
                                              HistoryDetailsSCreen.routeName,
                                              arguments: moodDetails);
                                        },
                                        child: Container(
                                          width: context.width(),
                                          height: 60.h,
                                          decoration: BoxDecoration(
                                              color: Palette.kWhiteColor
                                                  .withAlpha(200),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Row(
                                              children: [
                                                MoodHistoryDateWidget(
                                                  history: selectedMood == "All"
                                                      ? moodHistoryList[index]
                                                      : sortedMoodhistoryList[
                                                          index],
                                                ),
                                                const SizedBox(width: 10),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      selectedMood == "All"
                                                          ? moodHistoryList[
                                                                  index]
                                                              .chatTitle
                                                          : sortedMoodhistoryList[
                                                                  index]
                                                              .chatTitle,
                                                      style: CustomTextStyles
                                                          .subtitleLargeBold(
                                                              color: Palette
                                                                  .primaryBlackColor),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    HistoryTimeAndMood(
                                                        historyModel: selectedMood ==
                                                                "All"
                                                            ? moodHistoryList[
                                                                index]
                                                            : sortedMoodhistoryList[
                                                                index],
                                                        emotionAsCamelCase:
                                                            emotionAsCamelCase(
                                                                selectedMood,
                                                                moodHistoryList,
                                                                sortedMoodhistoryList,
                                                                index))
                                                  ],
                                                ),
                                                const Spacer(),
                                                Container(
                                                  width: 45.w,
                                                  height: 45.h,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: StringUtil.getCardColor(
                                                          selectedMood == "All"
                                                              ? moodHistoryList[
                                                                      index]
                                                                  .emotion
                                                              : sortedMoodhistoryList[
                                                                      index]
                                                                  .emotion)),
                                                  child: SvgPicture.asset(
                                                    StringUtil.getEmoji(
                                                        selectedMood == "All"
                                                            ? moodHistoryList[
                                                                    index]
                                                                .emotion
                                                            : sortedMoodhistoryList[
                                                                    index]
                                                                .emotion),
                                                    color: Palette
                                                        .primaryBlackColor,
                                                    height: 50.h,
                                                    width: 50.w,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                    }, error: (err, st) {
                      return Center(
                        child: Text("Something Went Wrong"),
                      );
                    }, loading: () {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 5,
                          children: [RotatingLogo(), Text("Loading..")],
                        ),
                      );
                    }))
                  ],
                ))));
  }
}

String emotionAsCamelCase(
    String selectedMood,
    List<EmotionHistoryModel> moodHistoryList,
    List<EmotionHistoryModel> sortedMoodHistoryList,
    int index) {
  String emotionAsCamelCase = "";
  if (selectedMood == "All") {
    emotionAsCamelCase = moodHistoryList[index].emotion[0].toUpperCase() +
        moodHistoryList[index].emotion.substring(1);
    return emotionAsCamelCase;
  } else {
    emotionAsCamelCase = sortedMoodHistoryList[index].emotion[0].toUpperCase() +
        sortedMoodHistoryList[index].emotion.substring(1);
    return emotionAsCamelCase;
  }
}
