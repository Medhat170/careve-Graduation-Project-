import 'package:careve/app/models/user.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  final CacheService cacheService;
  final currentIndex = 0.obs;
  final user = Rx<User>();

  AppService(this.cacheService);

  static AppService get to => Get.find();

  bool get isAuth => userId != null;

  String get userId => cacheService?.settingsRepo?.cachedUserId;

  Future<bool> tryAutoLogin() async {
    var cachedUserId = cacheService?.settingsRepo?.cachedUserId;
    print('cachedUserId : $cachedUserId');
    if (cachedUserId == null) {
      print('User is not auth!');
      return false;
    }
    final cachedUser = cacheService.userRepo.getValueById(cachedUserId);
    if (cachedUser == null) {
      print('User is not auth!');
      return false;
    }
    print('User is auth!');
    user.value = cachedUser;
    return true;
  }
}
