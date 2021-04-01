import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticlesController extends GetxController
    with SingleGetTickerProviderMixin, CustomAppBar {
  TabController tabController;
  int selectedIndex = 0;
  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
