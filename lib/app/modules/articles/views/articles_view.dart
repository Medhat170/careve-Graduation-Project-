import 'package:careve/app/components/animatedListHandler.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/articles_controller.dart';

class ArticlesView extends GetView<ArticlesController> {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Obx(
                () => controller.customAppBar(
                  'Search',
                  enableBack: true,
                  enableSearch: true,
                ),
              ),
              AnimatedListHandler(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
