import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/components/video_player_component.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/self_checking/components/SelfCheckingDataComponent.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/self_checking_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SelfCheckingView extends GetView<SelfCheckingController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: VideoPlayerComponent(
        upperChildren: [
          customAppBar(
            S.of(context).selfChecking,
            enableBack: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            child: Text(
              S.of(context).selfCheckingTitle,
              style: TextStyle(
                color: ColorUtil.blackColor,
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
        lowerChildren: [
          Obx(
            () => DotsIndicator(
              dotsCount: controller.selfCheckingData.length,
              position: controller.currentIndex.value.toDouble(),
              decorator: DotsDecorator(
                activeShape: RoundedRectangleBorder(
                  borderRadius: AppUtil.borderRadius,
                ),
                activeSize: Size(30.0, 10.0),
                color: ColorUtil.lightGrey,
                activeColor: ColorUtil.primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: PageView.builder(
              onPageChanged: (int value) => controller.currentIndex(value),
              itemCount: controller.selfCheckingData.length,
              itemBuilder: (context, index) => SelfCheckingDataComponent(
                selfCheckingData: controller.selfCheckingData[index],
              ),
            ),
          ),
        ],
        videoUrls: [
          controller.videoUrl,
        ],
      ),
    );
  }
}
