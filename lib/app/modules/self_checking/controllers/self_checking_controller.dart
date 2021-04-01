import 'package:careve/app/modules/self_checking/components/Forth_Step_Content.dart';
import 'package:careve/app/modules/self_checking/components/Frist_Step_content.dart';
import 'package:careve/app/modules/self_checking/components/Second_Step_Content.dart';
import 'package:careve/app/modules/self_checking/components/Third_Step_Content.dart';
import 'package:get/get.dart';
import 'package:careve/app/utilities/pathUtil.dart';

class SelfCheckingController extends GetxController {
  final currentIndex = 0.obs;
  List<Map<String, dynamic>> selfCheckingData = [
    {
      "image": PathUtil.articlesImage,
      "widget": FirstStepContent(),
    },
    {
      "image": PathUtil.articlesImage,
      "widget": SecondScreenContent(),
    },
    {
      "image": PathUtil.articlesImage,
      "widget": ThirdStepContent(),
    },
    {
      "image": PathUtil.articlesImage,
      "widget": ForthStepContent(),
    },
  ];
}
