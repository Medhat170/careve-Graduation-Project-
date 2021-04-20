import 'dart:io';

import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwarenessController extends GetxController
    with CustomAppBar, SingleGetTickerProviderMixin, BusyMixin, ApiMixin {
  GlobalKey<FormState> newArticleFormKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController article = TextEditingController();
  TextEditingController link = TextEditingController();
  final articleType = RxString();
  final image = Rx<File>();

  TabController tabController;
  final currentIndex = 0.obs;

  @override
  void onInit() {
    tabController = TabController(
      length: 3,
      vsync: this,
    );
    super.onInit();
  }

  void onChangeTab(int value) {
    currentIndex(value);
  }
}
