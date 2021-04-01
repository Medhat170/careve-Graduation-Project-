import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwarenessController extends GetxController
    with CustomAppBar, SingleGetTickerProviderMixin {
  TabController tabController;
  final currentIndex = 0.obs;

  @override
  void onInit() {
    tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    super.onInit();
  }

  void onChangeTab(int value) {
    currentIndex(value);
  }
}
