import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstTimeController extends GetxController {
  final currentIndex = 0.obs;
  List<Map<String, String>> splashData = [
    {
      "text":
          "You can find  the beast doctor and the nearest hospital to monitor your case",
      "image": PathUtil.splashscreen1Image
    },
    {
      "text": "Connect With Other People Who Are Experiencing The Same Things",
      "image": PathUtil.splashscreen2Image
    },
    {
      "text": "you can get articles and tests to check on your health",
      "image": PathUtil.splashscreen3Image
    },
  ];

  void onTapNext() {
    if (currentIndex.value != splashData.length - 1) {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: Duration(milliseconds: 300),
        curve: SawTooth(1),
      );
    }
  }

  PageController pageController = PageController(
    initialPage: 0,
  );
}
