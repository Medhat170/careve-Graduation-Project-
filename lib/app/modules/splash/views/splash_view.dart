import 'package:bdaya_custom_splash/bdaya_custom_splash.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
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
        return controller.initFunction(context);
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
        final bool firstTime = CacheService.to?.settingsRepo?.firstTime;
        if (firstTime == null || firstTime == true) {
          await CacheService.to?.settingsRepo?.setFirstTime(value: false);
          Get.offAllNamed(Routes.FIRST_TIME);
        } else {
          Get.offAllNamed(result.toString());
        }
      },
    );
  }
}
