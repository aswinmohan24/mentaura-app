import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mentaura_app/core/extensions.dart';
import 'package:mentaura_app/core/theme/text.styles.dart';

import '../../../../core/theme/color.palette.dart';

class MoodAnalyzeButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MoodAnalyzeButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.width() * .50,
        height: 38.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Palette.kPrimaryGreenColor),
            onPressed: onPressed,
            child: Row(
              children: [
                Text(
                  "AI",
                  style: CustomTextStyles.subtitleLargeBold(
                      color: Palette.backgroundColor),
                ),
                SvgPicture.asset(
                    height: 15, width: 15, "assets/images/svg/ai_stars.svg"),
                Text(
                  " Mood Analysis",
                  style: CustomTextStyles.subtitleLargeBold(
                      color: Palette.backgroundColor),
                ),
              ],
            )));
  }
}
