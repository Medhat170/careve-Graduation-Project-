import 'package:careve/app/models/user.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  final currentIndex = 0.obs;
  final user = Rx<User>();

  static AppService get to => Get.find();

  bool get isAuth => userId != null;

  String get userId => CacheService.to?.settingsRepo?.cachedUserId;

  Future<bool> tryAutoLogin() async {
    var cachedUserId = CacheService.to?.settingsRepo?.cachedUserId;
    if (cachedUserId == null) {
      print('User is not auth!');
      return false;
    }
    final cachedUser = CacheService.to.userRepo.getValueById(cachedUserId);
    if (cachedUser == null) {
      print('User is not auth!');
      return false;
    }
    print('User is auth!');
    user.value = cachedUser;
    return true;
  }
}
