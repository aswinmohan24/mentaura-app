import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:mentaura_app/core/extensions.dart';
import 'package:mentaura_app/core/theme/color.palette.dart';

class AiAnalyzeLoader extends StatelessWidget {
  const AiAnalyzeLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: context.width() - 50,
        height: context.width(),
        decoration: BoxDecoration(
          color: Palette.backgroundColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Lottie.asset("assets/lottie/mood_change_loading.json",
                  animate: true,
                  repeat: true,
                  fit: BoxFit.cover,
                  reverse: false),
            ),
            DefaultTextStyle(
                style: TextStyle(
                    fontFamily: "Monasans",
                    color: Palette.primaryBlackColor,
                    fontSize: 14.sp),
                child: Text("Sensing Your Mood...")),
          ],
        ));
  }
}
