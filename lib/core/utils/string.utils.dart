import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mentaura_app/core/theme/color.palette.dart';

class StringUtil {
  static String getRandomString(List<String> strings) {
    final random = Random();
    return strings[random.nextInt(strings.length)];
  }

  static String getWishString(DateTime currentTime) {
    final hour = currentTime.hour;

    if (hour >= 0 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 15) {
      return 'Good Afternoon';
    } else if (hour >= 15 && hour < 20) {
      return "Good Evening";
    } else {
      return 'Good Night';
    }
  }

  static String getEmoji(String emotion) {
    if (emotion == "happy" || emotion == "surprised") {
      return "assets/images/svg/happy_face.svg";
    } else if (emotion == "sad" || emotion == "depressed") {
      return "assets/images/svg/sad_face.svg";
    } else if (emotion == "angry") {
      return "assets/images/svg/angry_face.svg";
    } else {
      return "assets/images/svg/neutral.two.svg";
    }
  }

  static Color getCardColor(String emotion) {
    if (emotion == "surprised" || emotion == "neutral") {
      return Palette.successColor;
    } else if (emotion == "sad" || emotion == "depresees") {
      return Palette.errorColor;
    } else if (emotion == "happy") {
      return Palette.happyFaceColor;
    } else {
      return Colors.deepOrangeAccent;
    }
  }
}
