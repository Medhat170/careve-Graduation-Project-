import 'package:get/get.dart';

import '../controllers/medical_records_controller.dart';

class MedicalRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MedicalRecordsController>(
      MedicalRecordsController(Get.arguments as Map<String, dynamic>),
    );
  }
}
