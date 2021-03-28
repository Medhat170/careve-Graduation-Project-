import 'package:careve/app/modules/self_checking/components/Frist_Step_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careve/app/utilities/pathUtil.dart';

class SelfCheckingController extends GetxController {
  final currentIndex = 0.obs;
  List<Map<String, dynamic>> selfCheckingData = [
    {
      "image": PathUtil.selfCheckingImage,
      "widget": FirstStepContent(),
    },
    {
      "image": PathUtil.selfCheckingImage,
      "widget": FirstStepContent(),
    },
    {
      "image": PathUtil.selfCheckingImage,
      "widget": FirstStepContent(),
    },
    {
      "image": PathUtil.selfCheckingImage,
      "widget": FirstStepContent(),
    },
  ];
}