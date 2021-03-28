import 'package:bdaya_custom_splash/bdaya_custom_splash.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/app_service.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return BdayaCustomSplash(
      splashDuration: 4,
      backgroundBuilder: (child) {
        return Container(
          color: ColorUtil.whiteColor,
          child: child,
        );
      },
      initFunction: () async {
        return await controller.initFunction(context);
      },
      logoBuilder: () {
        return Center(
          child: Image.asset(
            PathUtil.logoIcon,
            height: 600.h,
          ),
        );
      },
      onNavigateTo: (result) async {
        bool firstTime = CacheService.to?.settingsRepo?.firstTime;
        if (firstTime == null || firstTime == true) {
          await CacheService.to?.settingsRepo?.setFirstTime(false);
          Get.offAllNamed(Routes.FIRST_TIME);
        } else {
          Get.offAllNamed(result);
        }
      },
    );
  }
}
