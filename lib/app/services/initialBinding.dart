import 'package:careve/app/services/auth_service.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthService>(
      AuthService(),
    );
  }
}
