import 'package:careve/app/components/user_image_handler.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalDataStep extends Step {
  PersonalDataStep({
    bool isActive = false,
    StepState stepState = StepState.editing,
  }) : super(
          title: !isActive
              ? const SizedBox.shrink()
              : FittedBox(
                  child: Text(
                    S.current.personalData,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
          isActive: isActive,
          state: stepState,
          content: Directionality(
            textDirection:
                AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
            child: Form(
              key: AuthService.to.personalDataFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ProfileImageHandler(),
                  AuthInputField(
                    S.current.name,
                    AuthService.to.name,
                    loading: AuthService.to.isBusy.value,
                    keyBoardType: TextInputType.text,
                    validator: const QuickTextValidator().call,
                  ),
                  AuthInputField(
                    S.current.email,
                    AuthService.to.email,
                    loading: AuthService.to.isBusy.value,
                    keyBoardType: TextInputType.emailAddress,
                    validator: const QuickTextValidator(
                      isEmail: true,
                    ).call,
                  ),
                  AuthInputField(
                    S.current.password,
                    AuthService.to.password,
                    loading: AuthService.to.isBusy.value,
                    isPassword: true,
                    hidePassword: AuthService.to.hidePassword.value,
                    changeObscuring: AuthService.to.changeObscuring,
                    keyBoardType: TextInputType.text,
                    validator: const QuickTextValidator(
                      hasMinLength: 8,
                    ).call,
                  ),
                  AuthInputField(
                    S.current.confirmPassword,
                    AuthService.to.confirmedPassword,
                    loading: AuthService.to.isBusy.value,
                    isPassword: true,
                    hidePassword: AuthService.to.hidePassword.value,
                    changeObscuring: AuthService.to.changeObscuring,
                    keyBoardType: TextInputType.text,
                    validator: QuickTextValidator(
                      extraValidation: (String value) {
                        if (AuthService.to.password.text !=
                            AuthService.to.confirmedPassword.text) {
                          return S.current.passwordsDoNotMatch;
                        }
                        return null;
                      },
                      hasMinLength: 8,
                    ).call,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.current.alreadyHaveAcc,
                        style: TextStyle(
                          fontSize: 46.sp,
                          color: ColorUtil.mediumGrey,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AuthService.to.signUP(false);
                          Get.back();
                        },
                        child: Text(
                          S.current.signIn,
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
        );
}
