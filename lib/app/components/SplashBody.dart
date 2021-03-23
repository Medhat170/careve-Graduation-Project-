import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import '../components/AppButton.dart';
import 'SplashContent.dart';
import 'package:get/get.dart';

class SplashBody extends StatefulWidget {
  @override
  _SplashBodyState createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":
          "You can find  the beast doctor and the nearest hospital to monitor your case",
      "image": PathUtil.splashscreen1Image
    },
    {
      "text": "Connect With Other People Who Are Experiencing The Same Things",
      "image": PathUtil.splashscreen2Image
    },
    {
      "text": "you can get articles and tests to check on your health",
      "image": PathUtil.splashscreen3Image
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Spacer(flex: 3),
                    AppButton(
                      'Next',
                      onTap: () {},
                      backgroundColor: ColorUtil.primaryColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    AppButton(
                      'Skip',
                      onTap: () => Get.toNamed(
                        Routes.HOME,
                      ),
                      textColor: ColorUtil.primaryColor,
                      backgroundColor: Colors.white,
                      borderColor: ColorUtil.primaryColor,
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
