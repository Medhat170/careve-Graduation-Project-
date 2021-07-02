import 'package:careve/app/modules/saved/controllers/saved_controller.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/services/cache/setting_repo.dart';
import 'package:careve/app/services/cache/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'FCM.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    final userRepo = Get.put(UserRepo());
    final settingsRepo = Get.put(SettingsRepo());

    final cacheService = Get.put<CacheService>(
      CacheService(
        userRepo,
        settingsRepo,
      ),
    );
    Get.put<AuthService>(
      AuthService(
        cacheService,
      ),
    );
    Get.put<SavedController>(
      SavedController(),
      permanent: true,
    );
  }
}
