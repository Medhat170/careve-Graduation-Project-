import 'package:careve/app/components/AppButton.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/components/backButton.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class VerificationCodeView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
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
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
                          child: Text(
                            'LOGO here', //TODO replace with logo
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 65.sp,
                            ),
                            textAlign: TextAlign.center,
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
                          hasUnderline: false,
                          wrapAlignment: WrapAlignment.spaceAround,
                          pinBoxDecoration:
                              ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                          pinTextStyle: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                          pinTextAnimatedSwitcherTransition:
                              ProvidedPinBoxTextAnimation.defaultNoTransition,
                          pinTextAnimatedSwitcherDuration: Duration(
                            milliseconds: 300,
                          ),
                          highlightAnimation: true,
                          highlightAnimationBeginColor: Colors.black,
                          highlightAnimationEndColor: ColorUtil.primaryColor,
                          keyboardType: TextInputType.number,
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
                          S.of(context).done,
                          onTap: () async => await controller.verifyCode(),
                          backgroundColor: ColorUtil.primaryColor,
                        ),
                      ],
                    ),
                    CircularBackButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
