import 'package:careve/app/components/AppButton.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/components/backButton.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneEntryView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: controller.phoneFormKey,
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 30.0,
                  ),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 50,
                            ),
                            child: Image.asset(
                              PathUtil.logoIcon,
                              height: 250.sp,
                            ),
                          ),
                          Text(
                            S.of(context).phoneNeededDesc,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 46.sp,
                              color: ColorUtil.mediumGrey,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          AuthInputField(
                            S.of(context).phoneNumber,
                            controller.phone,
                            isPhone: true,
                            loading: controller.isBusy.value,
                            keyBoardType: TextInputType.number,
                            validator: QuickTextValidator(
                              isPhone: true,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppButton(
                            S.of(context).done,
                            onTap: () async =>
                                await controller.sendPhoneNumber(),
                            backgroundColor: ColorUtil.primaryColor,
                          ),
                        ],
                      ),
                      CircularBackButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
