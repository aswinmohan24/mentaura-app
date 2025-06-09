import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mentaura_app/core/extensions.dart';
import 'package:mentaura_app/core/theme/color.palette.dart';
import 'package:mentaura_app/core/theme/text.styles.dart';
import 'package:mentaura_app/core/utils/string.utils.dart';
import 'package:mentaura_app/features/chat/application/chat.provider.dart';

class AiAnalysisScreen extends ConsumerStatefulWidget {
  static const routeName = "/chatAnalysis";
  const AiAnalysisScreen({super.key});

  @override
  ConsumerState<AiAnalysisScreen> createState() => _AiAnalysisScreenState();
}

class _AiAnalysisScreenState extends ConsumerState<AiAnalysisScreen> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    final emotionDetails = ref.read(emotionDetailsNotifierProvider);
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Palette.backgroundColor));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.backgroundColor,
          title: Text(
            "Details",
            style: CustomTextStyles.subtitleLargeSemiBold(
                color: Palette.primaryBlackColor),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: context.width(),
              height: context.width() * .55,
              decoration: BoxDecoration(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      width: 55.h,
                      height: 55.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: StringUtil.getCardColor(emotionDetails.emotion),
                      ),
                      child: SvgPicture.asset(
                        StringUtil.getEmoji(emotionDetails.emotion),
                        height: 50.h,
                        width: 50.w,
                        fit: BoxFit.cover,
                        color: Palette.kWhiteColor,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Container(s
                    //   height: 25.h,
                    //   padding:
                    //       EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    //   decoration: BoxDecoration(
                    //       color: Palette.backgroundColor,
                    //       border:
                    //           Border.all(color: getCardColor(), width: 1),
                    //       borderRadius:
                    //           BorderRadius.all(Radius.circular(20))),
                    //   child: Text("Feeling ${emotionDetails.emotion}"),
                    // ),
                    // SizedBox(
                    //   height: 5.h,
                    // ),
                    Text(
                      emotionDetails.suggestedReplyTitle,
                      style: CustomTextStyles.titleLargeBold(
                          color: Palette.primaryBlackColor),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      emotionDetails.suggestedReply,
                      style: CustomTextStyles.subtitleLargeRegular(
                          color: Palette.kPrimaryGreenColor),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Palette.kWhiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(30, 30),
                        topRight: Radius.elliptical(30, 30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        "Try This Out!",
                        style: CustomTextStyles.titleLargeBold(
                            fontSize: 14, color: Palette.kGreyColor),
                      ),
                      SizedBox(height: 10.h),
                      AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        width: context.width(),
                        height: isExpand
                            ? context.width() * .49
                            : context.width() * .25,
                        decoration: BoxDecoration(
                            color: Palette.backgroundColor,
                            border: Border(
                                top: BorderSide(
                                    width: 12,
                                    color: StringUtil.getCardColor(
                                        emotionDetails.emotion))),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.all(12),
                        child: Consumer(
                          builder: (context, ref, child) {
                            final emotionDetails =
                                ref.read(emotionDetailsNotifierProvider);
                            return SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/images/svg/activity_icon.svg",
                                        height: 9.h,
                                      ),
                                      const SizedBox(width: 5),
                                      Text("Activity",
                                          style: CustomTextStyles
                                              .subtitleSmallSemiBold()),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        emotionDetails.activityTitle,
                                        style:
                                            CustomTextStyles.subtitleLargeBold(
                                                fontSize: 16.sp,
                                                color:
                                                    Palette.primaryBlackColor),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isExpand = !isExpand;
                                            });
                                          },
                                          icon: Icon(
                                            isExpand
                                                ? Icons.expand_less
                                                : Icons.expand_more,
                                            color: Palette.primaryBlackColor,
                                          ))
                                    ],
                                  ),
                                  isExpand
                                      ? const SizedBox(height: 2)
                                      : const SizedBox.shrink(),
                                  !isExpand
                                      ? const SizedBox.shrink()
                                      : Text(
                                          emotionDetails.explanation,
                                          style: CustomTextStyles
                                              .subtitleLargeRegular(
                                            color: Palette.primaryBlackColor,
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      // SizedBox(height: 8.h),
                      // Container(
                      //   width: context.width(),
                      //   height: context.width() * .33,
                      //   decoration: BoxDecoration(
                      //       color: Palette.kPrimaryGreenColor,
                      //       // color: Palette.kSecondaryGreenColor,
                      //       borderRadius: BorderRadius.all(Radius.circular(15))),
                      // ),
                      // SizedBox(height: 8.h),
                      // Container(
                      //   width: context.width(),
                      //   height: context.width() * .25,
                      //   decoration: BoxDecoration(
                      //       color: Palette.kSecondaryGreenColor,
                      //       // color: Palette.kSecondaryGreenColor,
                      //       borderRadius: BorderRadius.all(Radius.circular(15))),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
