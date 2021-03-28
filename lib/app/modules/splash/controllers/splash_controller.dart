import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/app_service.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<Object> initFunction(BuildContext context) async {
    try {
      String currentLang = 'en';
      currentLang = await CacheService.to.initRepos();
      if (currentLang != null) await S.load(Locale(currentLang));
      final authLogicRes = await AppService.to.tryAutoLogin();
      String authRoute =
          authLogicRes == true ? Routes.MAIN : Routes.WELCOME_SCREEN;
      return authRoute;
    } catch (e) {
      AppUtil.showAlertDialog(title: S.current.alert, body: e.toString());
      rethrow;
    }
  }
}
