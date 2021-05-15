import 'package:careve/app/models/blog.dart';
import 'package:get/get.dart';

import '../controllers/awareness_info_controller.dart';

class AwarenessInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AwarenessInfoController>(
      AwarenessInfoController(Get.arguments as Article),
    );
  }
}
