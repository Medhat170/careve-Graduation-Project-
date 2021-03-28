import 'package:careve/app/modules/home/controllers/home_controller.dart';
import 'package:careve/app/services/app_service.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CacheService>(
      CacheService(),
    );
    Get.put<AppService>(
      AppService(),
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
