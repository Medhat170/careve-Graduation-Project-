import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/clinic_card.dart';
import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/modules/clinic_editing/controllers/clinic_editing_controller.dart';
import 'package:careve/app/modules/clinic_editing/views/clinic_editing_view.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (AuthService.to.user?.value?.id == null)
                      AuthInputField(
                        S.current.cost,
                        AuthService.to.cost,
                        loading: AuthService.to.isBusy.value,
                        keyBoardType: TextInputType.number,
                        validator: const QuickTextValidator().call,
                      ),
                    if (AuthService.to.user?.value?.id != null &&
                        AuthService.to.userClinics[0]?.address?.title != null)
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
                            onTap: () async {
                              Get.delete<ClinicEditingController>();
                              Get.put(ClinicEditingController(null));
                              final result = await Get.to<Clinic>(
                                () => ClinicEditingView(),
                              );
                              if (result != null) {
                                AuthService.to.userClinics.add(result);
                              }
                            },
                          ),
                        ],
                      ),
                    if (AuthService.to.user?.value?.id != null)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: AuthService.to.userClinics?.length ?? 0,
                        itemBuilder: (context, index) {
                          final e = AuthService.to.userClinics[index];
                          return ClinicCard(
                            clinicData: e,
                            removeFunction: () =>
                                AuthService.to.removeClinic(e.id),
                            loadingId: AuthService.to.busyId,
                            onTap: () async {
                              Get.delete<ClinicEditingController>();
                              Get.put(ClinicEditingController(e));
                              final result = await Get.to<Clinic>(
                                () => ClinicEditingView(),
                              );
                              if (result != null) {
                                AuthService.to.userClinics[index] = result;
                              }
                            },
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
}
