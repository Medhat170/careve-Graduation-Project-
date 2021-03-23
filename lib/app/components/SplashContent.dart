import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
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
            text,
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
            image,
            width: 600.w,
            height: 500.w,
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
        ],
      ),
    );
  }
}
