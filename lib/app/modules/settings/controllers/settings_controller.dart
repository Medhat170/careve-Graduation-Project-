import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  Future<void> changeLang(String lang) async {
    await S.load(Locale(lang));
    await CacheService.to.settingsRepo.setCachedLang(lang);
    CacheService.to.performInit(false);
    Get.offNamed(Routes.SPLASH);
  }

  Future<void> clearCache() async {
    // await CacheService.to.savedRepo.clear();
  }
}
