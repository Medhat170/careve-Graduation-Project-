import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:careve/app/models/user.dart';
import 'package:careve/app/services/cache/setting_repo.dart';
import 'package:careve/app/services/cache/user_repo.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheService extends GetxService {
  CacheService(this.userRepo, this.settingsRepo);

  static CacheService get to => Get.find();
  final performInit = true.obs;
  final UserRepo userRepo;
  final SettingsRepo settingsRepo;

  Future<String> initRepos() async {
    if (performInit.value) {
      await Hive.initFlutter('v1');
      await userRepo.init();
      await settingsRepo.init();
    }
    return settingsRepo.cachedLang;
  }

  static void registerTypeAdapters() {
    Hive.registerAdapter(UserAdapter());
  }
}
