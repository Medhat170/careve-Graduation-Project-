import 'package:get/get.dart';

import '../controllers/single_doctor_controller.dart';

class SingleDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SingleDoctorController>(
      () => SingleDoctorController(),
    );
  }
}
