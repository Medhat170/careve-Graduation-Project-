import 'package:careve/app/components/appButton.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/components/backButton.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SafeArea(
        child: Scaffold(
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
                                  validator: QuickTextValidator().call,
                                ),
                              AuthInputField(
                                S.of(context).email,
                                controller.email,
                                loading: controller.isBusy.value,
                                keyBoardType: TextInputType.emailAddress,
                                validator: QuickTextValidator(
                                  isEmail: true,
                                ).call,
                              ),
                              AuthInputField(
                                S.of(context).password,
                                controller.password,
                                loading: controller.isBusy.value,
                                isPassword: true,
                                hidePassword: controller.hidePassword.value,
                                changeObscuring: () => controller.hidePassword
                                    .value = !controller.hidePassword.value,
                                keyBoardType: TextInputType.text,
                                validator: QuickTextValidator(
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
                                  changeObscuring: () => controller.hidePassword
                                      .value = !controller.hidePassword.value,
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
                              controller.isBusy.value
                                  ? Loading()
                                  : CareveButton(
                                      title: controller.signUP.value
                                          ? S.of(context).signUp
                                          : S.of(context).signIn,
                                      onTap: () async {
                                        await controller.auth();
                                      },
                                      backgroundColor: ColorUtil.primaryColor,
                                    ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              if (!controller.signUP.value)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () =>
                                          Get.toNamed(Routes.PHONE_ENTRY),
                                      child: Text(
                                        S.of(context).forgetPassword,
                                        style: TextStyle(
                                          fontSize: 46.sp,
                                          color: ColorUtil.mediumGrey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.center,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.symmetric(
                              //         vertical: 20.0,
                              //       ),
                              //       child: Text(
                              //         '- OR -',
                              //         style: TextStyle(
                              //           fontSize: 40.sp,
                              //         ),
                              //       ),
                              //     ),
                              //     Row(
                              //       children: [
                              //         Expanded(
                              //           child: CareveButton.icon(
                              //             title: 'facebook',
                              //             onTap: () {},
                              //             elevation: 2.0,
                              //             backgroundColor: ColorUtil.lightGrey,
                              //             textColor: ColorUtil.blackColor,
                              //             icon: Image.asset(
                              //               PathUtil.facebookIcon,
                              //               width: 40.0,
                              //               height: 40.0,
                              //             ),
                              //           ),
                              //         ),
                              //         const SizedBox(
                              //           width: 20.0,
                              //         ),
                              //         Expanded(
                              //           child: CareveButton.icon(
                              //             title: 'Google',
                              //             onTap: () {},
                              //             elevation: 2.0,
                              //             backgroundColor: ColorUtil.lightGrey,
                              //             textColor: ColorUtil.blackColor,
                              //             icon: Image.asset(
                              //               PathUtil.googleIcon,
                              //               width: 40.0,
                              //               height: 40.0,
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //
                              //
                              //   ],
                              // ),
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
                                    onTap: () => controller
                                        .signUP(!controller.signUP.value),
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
        ),
      ),
    );
  }
}
