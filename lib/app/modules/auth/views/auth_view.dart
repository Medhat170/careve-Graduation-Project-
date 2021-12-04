import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/back_button.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SizedBox(
        height: Get.height -
            Get.mediaQuery.padding.top -
            Get.mediaQuery.padding.bottom,
        width: Get.width,
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.authFormKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Image.asset(
                              PathUtil.logoIcon,
                              height: 250.sp,
                            ),
                          ),
                          if (controller.signUP.value)
                            AuthInputField(
                              S.of(context).name,
                              controller.name,
                              loading: controller.isBusy.value,
                              keyBoardType: TextInputType.text,
                              validator: const QuickTextValidator().call,
                            ),
                          AuthInputField(
                            S.of(context).email,
                            controller.email,
                            loading: controller.isBusy.value,
                            keyBoardType: TextInputType.emailAddress,
                            validator: const QuickTextValidator(
                              isEmail: true,
                            ).call,
                          ),
                          AuthInputField(
                            S.of(context).password,
                            controller.password,
                            loading: controller.isBusy.value,
                            isPassword: true,
                            hidePassword: controller.hidePassword.value,
                            changeObscuring: controller.changeObscuring,
                            keyBoardType: TextInputType.text,
                            validator: const QuickTextValidator(
                              hasMinLength: 8,
                            ).call,
                          ),
                          if (controller.signUP.value)
                            AuthInputField(
                              S.of(context).confirmPassword,
                              controller.confirmedPassword,
                              loading: controller.isBusy.value,
                              isPassword: true,
                              hidePassword: controller.hidePassword.value,
                              changeObscuring: controller.changeObscuring,
                              keyBoardType: TextInputType.text,
                              validator: QuickTextValidator(
                                extraValidation: (String value) {
                                  if (controller.password.text !=
                                      controller.confirmedPassword.text) {
                                    return S.current.passwordsDoNotMatch;
                                  }
                                  return null;
                                },
                                hasMinLength: 8,
                              ).call,
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (controller.isBusy.value)
                            Loading()
                          else
                            AppButton(
                              title: controller.signUP.value
                                  ? S.of(context).signUp
                                  : S.of(context).signIn,
                              onTap: () => controller.auth(),
                            ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          // if (!controller.signUP.value)
                          //   Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       InkWell(
                          //         onTap: () => Get.toNamed(Routes.PHONE_ENTRY),
                          //         child: Text(
                          //           S.of(context).forgetPassword,
                          //           style: TextStyle(
                          //             fontSize: 46.sp,
                          //             color: ColorUtil.mediumGrey,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.signUP.value
                                    ? S.of(context).alreadyHaveAcc
                                    : S.of(context).donNotHaveAcc,
                                style: TextStyle(
                                  fontSize: 46.sp,
                                  color: ColorUtil.mediumGrey,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  if (controller.isDoc.value) {
                                    controller.signUP(true);
                                    Get.toNamed(
                                      Routes.DOCTOR_AUTH,
                                    );
                                  } else {
                                    controller.signUP(!controller.signUP.value);
                                  }
                                },
                                child: Text(
                                  controller.signUP.value
                                      ? S.of(context).signIn
                                      : S.of(context).signUp,
                                  style: TextStyle(
                                    fontSize: 50.sp,
                                    color: ColorUtil.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 20,
              ),
              child: CircularBackButton(),
            ),
          ],
        ),
      ),
    );
  }
}
