import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/auth/components/doc_auth_steps/clinic_data_step/clinic_component.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsClinicsEditingView extends GetView<AuthService>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          customAppBar(
            S.of(context).editAppointmentsClinics,
            enableBack: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(
                () => AnimatedListHandler(
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
                    CareveButton(
                      title: S.of(context).done,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
