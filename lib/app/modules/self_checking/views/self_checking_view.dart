import 'package:careve/app/components/backButton.dart';
import 'package:careve/app/modules/self_checking/components/SelfCheckingDataComponent.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/self_checking_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SelfCheckingView extends GetView<SelfCheckingController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CircularBackButton(),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Learn how to do a breast self checking',
                  style: TextStyle(
                    color: ColorUtil.blackColor,
                    fontSize: 35.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: PageView.builder(
                  itemCount: controller.selfCheckingData.length,
                  itemBuilder: (context, index) => SelfCheckingDataComponent(
                    image: controller.selfCheckingData[index]["image"],
                    widget: controller.selfCheckingData[index]["widget"],
                  ),
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
