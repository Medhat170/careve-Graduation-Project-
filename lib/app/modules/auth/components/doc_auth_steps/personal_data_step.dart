import 'package:careve/app/components/user_image_handler.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalDataStep extends Step {
  PersonalDataStep({
    bool isActive = false,
    StepState stepState = StepState.editing,
  }) : super(
          title: !isActive
              ? SizedBox.shrink()
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
                    validator: QuickTextValidator().call,
                  ),
                  AuthInputField(
                    S.current.email,
                    AuthService.to.email,
                    loading: AuthService.to.isBusy.value,
                    keyBoardType: TextInputType.emailAddress,
                    validator: QuickTextValidator(
                      isEmail: true,
                    ).call,
                  ),
                  AuthInputField(
                    S.current.password,
                    AuthService.to.password,
                    loading: AuthService.to.isBusy.value,
                    isPassword: true,
                    hidePassword: AuthService.to.hidePassword.value,
                    changeObscuring: () => AuthService.to.hidePassword.value =
                        !AuthService.to.hidePassword.value,
                    keyBoardType: TextInputType.text,
                    validator: QuickTextValidator(
                      hasMinLength: 8,
                    ).call,
                  ),
                  AuthInputField(
                    S.current.confirmPassword,
                    AuthService.to.confirmedPassword,
                    loading: AuthService.to.isBusy.value,
                    isPassword: true,
                    hidePassword: AuthService.to.hidePassword.value,
                    changeObscuring: () => AuthService.to.hidePassword.value =
                        !AuthService.to.hidePassword.value,
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
                ],
              ),
            ),
          ),
        );
}
