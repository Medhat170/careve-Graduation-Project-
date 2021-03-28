import 'package:get/get.dart';

import '../controllers/self_checking_controller.dart';

class SelfCheckingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelfCheckingController>(
      () => SelfCheckingController(),
    );
  }
}
