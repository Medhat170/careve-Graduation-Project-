import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
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
                        'Careve',
                        style: TextStyle(
                          color: ColorUtil.whiteColor,
                          fontSize: 74.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        S.of(context).welcome,
                        style: TextStyle(
                          color: ColorUtil.whiteColor,
                          fontSize: 100.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.6,
                        child: Text(
                          S.of(context).welcomeText,
                          style: TextStyle(
                            color: ColorUtil.whiteColor,
                            fontSize: 46.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: true,
                        ),
                      ),
                      SizedBox(
                        height: 300.h,
                      ),
                      CareveButton(
                        title: S.of(context).normalUser,
                        onTap: () {
                          AuthService.to.signUP(false);
                          AuthService.to.isDoc(false);
                          Get.toNamed(
                            Routes.AUTH,
                          );
                        },
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      CareveButton(
                        title: S.of(context).doctor,
                        backgroundColor: Colors.transparent,
                        borderColor: ColorUtil.primaryColor,
                        onTap: () {
                          AuthService.to.signUP(false);
                          AuthService.to.isDoc(true);
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
