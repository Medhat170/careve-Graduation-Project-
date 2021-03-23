import 'package:careve/app/components/AppButton.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          children: [
            Text(
              'Welcome! to careve',
              style: TextStyle(
                color: ColorUtil.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'You can find  the beast doctor and the nearest hospital to monitor your case',
              softWrap: true,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Image.asset(
              PathUtil.splashscreen1Image,
            ),
            SizedBox(
              height: 5,
            ),
            new DotsIndicator(
              dotsCount: 3,
              position: 0,
              decorator: DotsDecorator(
                color: Color(0xffC4C4C4), // Inactive color
                activeColor: ColorUtil.primaryColor,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            AppButton(
               'Next',
              backgroundColor: ColorUtil.primaryColor,
              onTap: () {},
              textColor: Colors.white,
            ),
            SizedBox(
              height: 15,
            ),
            AppButton(
               'Skip',
              backgroundColor: Colors.white,
              onTap: () {},
              textColor: ColorUtil.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
