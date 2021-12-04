import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/back_button.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerificationCodeView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Container(
            height: Get.height -
                Get.mediaQuery.padding.top -
                Get.mediaQuery.padding.bottom,
            width: Get.width,
            padding: const EdgeInsets.all(30.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Image.asset(
                        PathUtil.logoIcon,
                        height: 250.sp,
                      ),
                    ),
                    Text(
                      S.of(context).verifyText,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 46.sp,
                        color: ColorUtil.mediumGrey,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    PinCodeTextField(
                      autofocus: true,
                      controller: controller.code,
                      hideCharacter: true,
                      highlight: true,
                      errorBorderColor: ColorUtil.errorColor,
                      pinBoxRadius: 10,
                      pinBoxBorderWidth: 0.5,
                      highlightColor: ColorUtil.primaryColor,
                      defaultBorderColor: ColorUtil.primaryColor,
                      hasTextBorderColor: ColorUtil.primaryColor,
                      highlightPinBoxColor: ColorUtil.lightGrey,
                      maxLength: 6,
                      maskCharacter: '*',
                      hasError: controller.pinCodeError.value != null,
                      onTextChanged: (text) {},
                      onDone: (text) {
                        print("DONE $text");
                        print("DONE CONTROLLER ${controller.code}");
                        //TODO send api
                      },
                      pinBoxWidth: 120.w,
                      pinBoxHeight: 160.w,
                      wrapAlignment: WrapAlignment.spaceAround,
                      pinBoxDecoration:
                          ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                      pinTextStyle: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                      pinTextAnimatedSwitcherTransition:
                          ProvidedPinBoxTextAnimation.defaultNoTransition,
                      pinTextAnimatedSwitcherDuration: const Duration(
                        milliseconds: 300,
                      ),
                      highlightAnimation: true,
                      highlightAnimationBeginColor: Colors.black,
                      highlightAnimationEndColor: ColorUtil.primaryColor,
                    ),
                    if (controller.pinCodeError.value != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          controller.pinCodeError.value,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 38.sp,
                            color: ColorUtil.errorColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppButton(
                      title: S.of(context).done,
                      onTap: () => controller.verifyCode(),
                    ),
                  ],
                ),
                CircularBackButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
