import 'package:bdaya_repository_pattern/bdaya_repository_pattern.dart';
import 'package:careve/app/models/user.dart';
import 'package:careve/app/services/cache/setting_repo.dart';
import 'package:careve/app/services/cache/user_repo.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CacheService extends GetxService {
  static CacheService get to => Get.find();

  UserRepo _userRepo;
  SettingsRepo _settingsRepo;

  UserRepo get userRepo => _userRepo;

  SettingsRepo get settingsRepo => _settingsRepo;

  Future<void> initRepos() async {
    await Hive.initFlutter('v1');
    await (_userRepo = UserRepo()).init();
    await (_settingsRepo = SettingsRepo()).init();
  }

  static void registerTypeAdapters() {
    Hive.registerAdapter(UserAdapter());
  }

  @override
  void onInit() async {
    await initRepos();
    super.onInit();
  }
}
