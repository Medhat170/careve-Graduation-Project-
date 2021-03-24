import 'package:get/get.dart';

import '../controllers/first_time_controller.dart';

class FirstTimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstTimeController>(
      () => FirstTimeController(),
    );
  }
}
