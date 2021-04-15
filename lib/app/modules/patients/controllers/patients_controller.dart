import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:get/get.dart';

class PatientsController extends GetxController
    with CustomAppBar, BusyMixin, ApiMixin {
  //TODO: Implement PatientsController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
