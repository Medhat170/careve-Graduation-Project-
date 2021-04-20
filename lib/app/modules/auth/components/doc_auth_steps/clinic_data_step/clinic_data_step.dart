import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/modules/auth/components/doc_auth_steps/clinic_data_step/clinic_component.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClinicDataStep extends Step {
  ClinicDataStep({
    bool isActive = false,
    StepState stepState = StepState.editing,
  }) : super(
          title: !isActive
              ? const SizedBox.shrink()
              : FittedBox(
                  child: Text(
                    S.current.clinicData,
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
              key: AuthService.to.clinicFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          S.current.addClinic,
                          style: TextStyle(
                            color: ColorUtil.mediumGrey,
                            fontSize: 56.sp,
                          ),
                        ),
                      ),
                      CareveButton.icon(
                        width: 150.w,
                        height: 100.w,
                        icon: const Icon(
                          Icons.add,
                          color: ColorUtil.primaryColor,
                          size: 22.0,
                        ),
                        backgroundColor: Colors.transparent,
                        borderColor: ColorUtil.primaryColor,
                        onTap: () => AuthService.to.addNewClinic(),
                      ),
                    ],
                  ),
                  ...List.generate(
                    AuthService.to.userClinics.value.clinics.length,
                    (index) {
                      return ClinicComponent(
                        index: index,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
}
