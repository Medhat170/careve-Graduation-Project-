import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleDoctorController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController tabController;
  int selectedIndex = 0;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
