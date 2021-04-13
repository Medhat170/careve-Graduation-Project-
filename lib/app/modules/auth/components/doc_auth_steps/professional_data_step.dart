import 'package:careve/app/components/user_image_handler.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfessionalDataStep extends Step {
  ProfessionalDataStep({
    bool isActive = false,
    StepState stepState = StepState.editing,
  }) : super(
          title: !isActive
              ? SizedBox.shrink()
              : FittedBox(
                  child: Text(
                    S.current.professionalData,
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
              key: AuthService.to.docVerificationFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // AuthInputField(
                  //   S.current.name,
                  //   AuthService.to.name,
                  //   loading: AuthService.to.isBusy.value,
                  //   keyBoardType: TextInputType.text,
                  //   validator: QuickTextValidator().call,
                  // ),
                  // AuthInputField(
                  //   S.current.email,
                  //   AuthService.to.email,
                  //   loading: AuthService.to.isBusy.value,
                  //   keyBoardType: TextInputType.emailAddress,
                  //   validator: QuickTextValidator(
                  //     isEmail: true,
                  //   ).call,
                  // ),
                ],
              ),
            ),
          ),
        );
}
