import 'package:get/get.dart';

import '../controllers/clinic_editing_controller.dart';

class ClinicEditingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicEditingController>(
      () => ClinicEditingController(),
    );
  }
}
