import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentaura_app/features/chat/application/chat.provider.dart';
import 'package:mentaura_app/core/theme/color.palette.dart';
import 'package:mentaura_app/core/extensions.dart';
import 'package:mentaura_app/core/theme/text.styles.dart';
import 'package:mentaura_app/core/utils/string.utils.dart';
import 'package:mentaura_app/features/chat/presentation/screens/chat.screen.dart';

import '../widgets/home.screen.appbar.dart';
import '../widgets/mood.analyze.button.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = "/homescreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Palette.backgroundColor,
        statusBarIconBrightness: Brightness.dark));
    final wishString = StringUtil.getWishString(DateTime.now());

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            // Container(
            // width: context.width(),
            // height: context.height(),
            // decoration: BoxDecoration(
            //     color: Palette.backgroundColor,
            //     borderRadius: BorderRadius.only(
            //         bottomRight: Radius.elliptical(50, 50),
            //         bottomLeft: Radius.elliptical(50, 50))),
            // child:
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HomeScreenAppBar(),
                  SizedBox(
                    height: 18.h,
                  ),
                  Text(
                    wishString,
                    textAlign: TextAlign.start,
                    style: CustomTextStyles.titleLargeBold(
                        color: Palette.primaryBlackColor, fontSize: 21.sp),
                  ),
                  Text(
                    "Hi, How Do You Feel Today?",
                    textAlign: TextAlign.start,
                    style: CustomTextStyles.titleLargeRegular(
                        color: Palette.primaryBlackColor, fontSize: 15.sp),
                  ),
                  const SizedBox(height: 13),
                  MoodAnalyzeButton(
                    onPressed: () {
                      ref.read(lastWordProvider.notifier).state = "";
                      ref.read(keyboardProvider.notifier).state = false;
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          barrierColor: Colors.black38,
                          builder: (context) {
                            return DraggableScrollableSheet(
                                expand: false,
                                initialChildSize: .78, // 1.0 means full screen
                                maxChildSize: .78,
                                minChildSize: 0.3,
                                builder: (context, scrollController) =>
                                    const ChatScreen());
                          });
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),
            Container(
              width: context.width(),
              height: 100.h,
              decoration: BoxDecoration(
                  // gradient: LinearGradient(colors: [
                  //   Palette.kPrimaryGreenColor,
                  //   Palette.kSecondaryGreenColor,
                  //   Palette.yellowAccent
                  // ]),
                  color: Palette.backgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            )
          ],
        ),
      ),
    ));
  }
}
