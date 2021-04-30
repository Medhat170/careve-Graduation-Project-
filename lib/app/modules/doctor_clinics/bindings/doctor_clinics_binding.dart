import 'package:get/get.dart';

import '../controllers/doctor_clinics_controller.dart';

class DoctorClinicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorClinicsController>(
      () => DoctorClinicsController(),
    );
  }
}
