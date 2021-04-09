import 'package:careve/app/modules/saved/controllers/saved_controller.dart';
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
