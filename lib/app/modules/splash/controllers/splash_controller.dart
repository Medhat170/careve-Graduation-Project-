import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/FCM.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

class SplashController extends GetxController {
  Future<String> initFunction(BuildContext context) async {
    try {
      String currentLang = 'en';
      currentLang = await CacheService.to.initRepos();
      if (currentLang != null) await S.load(Locale(currentLang));
      final authLogicRes = await AuthService.to.tryAutoLogin();
      await Firebase.initializeApp();
      Get.put(FirebaseNotifications());
      final String authRoute =
          authLogicRes == true ? Routes.HOME : Routes.WELCOME_SCREEN;
      return authRoute;
    } catch (e) {
      AppUtil.showAlertDialog(title: S.current.alert, body: e.toString());
      rethrow;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
