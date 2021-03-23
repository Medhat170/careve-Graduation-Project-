import 'package:careve/app/components/AppButton.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/components/backButton.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/auth_service.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            height: Get.height -
                Get.mediaQuery.padding.top -
                Get.mediaQuery.padding.bottom,
            width: Get.width,
            child: Form(
              key: controller.authFormKey,
              child: Stack(
                children: [
                  Obx(
                    () => ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 20,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                          ),
                          child: Text(
                            'Logo here', //TODO replace with logo
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 65.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        if (controller.signUP.value)
                          AuthInputField(
                            S.of(context).name,
                            controller.name,
                            loading: controller.isBusy.value,
                            keyBoardType: TextInputType.text,
                            validator: QuickTextValidator(),
                          ),
                        AuthInputField(
                          S.of(context).email,
                          controller.email,
                          loading: controller.isBusy.value,
                          keyBoardType: TextInputType.emailAddress,
                          validator: QuickTextValidator(
                            isEmail: true,
                          ),
                        ),
                        AuthInputField(
                          S.of(context).password,
                          controller.password,
                          loading: controller.isBusy.value,
                          isPassword: true,
                          hidePassword: controller.hidePassword.value,
                          changeObscuring: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          keyBoardType: TextInputType.text,
                          validator: QuickTextValidator(
                            hasMinLength: 8,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppButton(
                          S.of(context).signIn,
                          onTap: () async => await controller.auth(),
                          backgroundColor: ColorUtil.primaryColor,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () => Get.toNamed(Routes.PHONE_ENTRY),
                              child: Text(
                                S.of(context).forgetPassword,
                                style: TextStyle(
                                  fontSize: 46.sp,
                                  color: ColorUtil.primaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: Text(
                                '- OR -',
                                style: TextStyle(
                                  fontSize: 40.sp,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: AppButton(
                                    'facebook',
                                    onTap: () {},
                                    elevation: 2.0,
                                    backgroundColor: ColorUtil.lightGrey,
                                    textColor: ColorUtil.blackColor,
                                    imagePath: PathUtil.facebookIcon,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Expanded(
                                  child: AppButton(
                                    'Google',
                                    onTap: () {},
                                    elevation: 2.0,
                                    backgroundColor: ColorUtil.lightGrey,
                                    textColor: ColorUtil.blackColor,
                                    imagePath: PathUtil.googleIcon,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: CircularBackButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
