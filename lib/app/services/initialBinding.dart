import 'package:careve/app/modules/home/controllers/home_controller.dart';
import 'package:careve/app/services/app_service.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/services/cache/setting_repo.dart';
import 'package:careve/app/services/cache/user_repo.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    var userRepo = Get.put(UserRepo());
    var settingsRepo = Get.put(SettingsRepo());

    var cacheService = Get.put<CacheService>(
      CacheService(
        userRepo,
        settingsRepo,
      ),
    );
    Get.put<AppService>(
      AppService(
        cacheService,
      ),
    );
    Get.put<AuthService>(
      AuthService(),
    );
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );
  }
}
