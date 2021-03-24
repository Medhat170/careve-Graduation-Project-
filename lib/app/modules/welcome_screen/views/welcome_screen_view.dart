import 'package:careve/app/components/AppButton.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/welcome_screen_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      PathUtil.welcomeImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                color: ColorUtil.transparentPink,
              ),
              SizedBox(
                width: Get.width,
                height: Get.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50.0,
                    horizontal: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        PathUtil.favIcon,
                        width: 100.w,
                        height: 100.w,
                      ),
                      Text(
                        'careve',
                        style: TextStyle(
                          fontSize: 74.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'Welcome...',
                        style: TextStyle(
                          fontSize: 100.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Text(
                          'to careve for breast cancer awareness and women health care.',
                          style: TextStyle(
                            fontSize: 46.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: true,
                        ),
                      ),
                      SizedBox(
                        height: 300.h,
                      ),
                      AppButton(
                        S.of(context).signUp,
                        textColor: ColorUtil.whiteColor,
                        backgroundColor: ColorUtil.primaryColor,
                        onTap: () {
                          AuthService.to.signUP(true);
                          Get.toNamed(
                            Routes.AUTH,
                          );
                        },
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      AppButton(
                        'Sign In',
                        backgroundColor: Colors.transparent,
                        borderColor: ColorUtil.primaryColor,
                        onTap: () {
                          AuthService.to.signUP(false);
                          Get.toNamed(
                            Routes.AUTH,
                          );
                        },
                        textColor: ColorUtil.primaryColor,
                      ),
                    ],
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
