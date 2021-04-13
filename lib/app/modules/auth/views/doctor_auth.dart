import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/modules/auth/components/doc_auth_steps/clinic_data_step.dart';
import 'package:careve/app/modules/auth/components/doc_auth_steps/personal_data_step.dart';
import 'package:careve/app/modules/auth/components/doc_auth_steps/professional_data_step.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorAuthView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SizedBox(
        height: Get.height -
            Get.mediaQuery.padding.top -
            Get.mediaQuery.padding.bottom,
        width: Get.width,
        child: Obx(
          () => Column(
            children: <Widget>[
              Expanded(
                child: Stepper(
                  type: StepperType.horizontal,
                  steps: [
                    PersonalDataStep(
                      isActive: controller.stepActivation[0],
                      stepState: controller.stepStates[0],
                    ),
                    ClinicDataStep(
                      isActive: controller.stepActivation[1],
                      stepState: controller.stepStates[1],
                    ),
                    ProfessionalDataStep(
                      isActive: controller.stepActivation[2],
                      stepState: controller.stepStates[2],
                    ),
                  ],
                  currentStep: controller.currentStep.value,
                  onStepContinue: controller.onStepContinue,
                  onStepTapped: null,
                  onStepCancel: controller.onStepCancel,
                  controlsBuilder: (
                    BuildContext context, {
                    VoidCallback onStepContinue,
                    VoidCallback onStepCancel,
                  }) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: controller.isBusy.value
                          ? Loading()
                          : Row(
                              children: [
                                if (controller.currentStep.value != 0)
                                  InkWell(
                                    onTap: onStepCancel,
                                    child: Text(
                                      S.of(context).back,
                                      style: TextStyle(
                                        color: ColorUtil.errorColor,
                                        fontSize: 34.sp,
                                      ),
                                    ),
                                  ),
                                Spacer(),
                                FloatingActionButton.extended(
                                  tooltip: S.of(context).clinicData,
                                  onPressed: controller.currentStep.value == 2
                                      ? () {
                                          // => Get.offAllNamed(
                                          //     Routes.MAIN)
                                        }
                                      : onStepContinue,
                                  backgroundColor: ColorUtil.primaryColor,
                                  elevation: 5.0,
                                  icon: controller.currentStep.value == 2
                                      ? null
                                      : Icon(
                                          controller.currentStep.value == 1
                                              ? AppUtil.isLtr
                                                  ? FontAwesomeIcons
                                                      .angleDoubleRight
                                                  : FontAwesomeIcons
                                                      .angleDoubleLeft
                                              : AppUtil.isLtr
                                                  ? FontAwesomeIcons.angleRight
                                                  : FontAwesomeIcons.angleLeft,
                                          color: Colors.white,
                                          size: 34.0,
                                        ),
                                  label: Text(
                                    controller.currentStep.value == 1
                                        ? S.of(context).professionalData
                                        : controller.currentStep.value == 2
                                            ? S.of(context).signUp
                                            : S.of(context).clinicData,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
