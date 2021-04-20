import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/modules/first_time/components/welcome_data_component.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/first_time_controller.dart';

class FirstTimeView extends GetView<FirstTimeController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: (int value) {
                  controller.currentIndex(value);
                },
                itemCount: controller.splashData.length,
                itemBuilder: (context, index) => WelcomeDataComponent(
                  image: controller.splashData[index]["image"],
                  text: controller.splashData[index]['text'],
                ),
              ),
            ),
            Obx(
              () => DotsIndicator(
                dotsCount: controller.splashData.length,
                position: controller.currentIndex.value.toDouble(),
                decorator: DotsDecorator(
                  activeShape: RoundedRectangleBorder(
                    borderRadius: AppUtil.borderRadius,
                  ),
                  activeSize: const Size(30.0, 10.0),
                  color: ColorUtil.lightGrey,
                  activeColor: ColorUtil.primaryColor,
                ),
              ),
            ),
            CareveButton(
              title: S.of(context).next,
              onTap: () => controller.onTapNext(),
            ),
            const SizedBox(
              height: 15,
            ),
            CareveButton(
              title: S.of(context).skip,
              onTap: () => Get.offNamed(
                Routes.WELCOME_SCREEN,
              ),
              textColor: ColorUtil.primaryColor,
              backgroundColor: Colors.white,
              borderColor: ColorUtil.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
