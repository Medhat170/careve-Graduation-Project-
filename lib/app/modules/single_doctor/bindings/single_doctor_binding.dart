import 'package:careve/app/models/all_doctors.dart';
import 'package:get/get.dart';

import '../controllers/single_doctor_controller.dart';

class SingleDoctorBinding extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments as Doctor;
    Get.put<SingleDoctorController>(
      SingleDoctorController(
        Doctor(
          id: args?.id,
          image: args?.image,
          cost: args?.cost,
          name: args?.name,
          qualified: args?.qualified,
          raters: args?.raters,
          rating: args?.rating,
        ),
      ),
    );
  }
}
