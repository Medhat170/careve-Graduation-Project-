import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  @override
  void onInit() {
    precacheImage(
      AssetImage(
        PathUtil.welcomeImage,
      ),
      Get.context,
    );
    precacheImage(
      AssetImage(
        PathUtil.splashscreen1Image,
      ),
      Get.context,
    );
    precacheImage(
      AssetImage(
        PathUtil.splashscreen2Image,
      ),
      Get.context,
    );
    precacheImage(
      AssetImage(
        PathUtil.splashscreen3Image,
      ),
      Get.context,
    );
    super.onInit();
  }
}
