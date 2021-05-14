import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:get/get.dart';

import '../controllers/clinic_editing_controller.dart';

class ClinicEditingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicEditingController>(
      () => ClinicEditingController(
        Get.arguments as Clinic,
      ),
    );
  }
}
