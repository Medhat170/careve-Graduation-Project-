import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstTimeController extends GetxController {
  final currentIndex = 0.obs;
  List<Map<String, String>> splashData = [
    {
      "text": S.current.splashText1,
      "image": PathUtil.splashscreen1Image,
    },
    {
      "text": S.current.splashText2,
      "image": PathUtil.splashscreen1Image,
    },
    {
      "text": S.current.splashText3,
      "image": PathUtil.splashscreen3Image,
    },
  ];

  void onTapNext() {
    if (currentIndex.value != splashData.length - 1) {
      pageController.animateToPage(
        currentIndex.value + 1,
        duration: Duration(milliseconds: 300),
        curve: SawTooth(1),
      );
    } else {
      Get.offNamed(
        Routes.WELCOME_SCREEN,
      );
    }
  }

  PageController pageController = PageController(
    initialPage: 0,
  );
}
