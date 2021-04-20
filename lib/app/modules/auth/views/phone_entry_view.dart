import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/back_button.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneEntryView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
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
                        validator: const QuickTextValidator(
                          isPhone: true,
                        ).call,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CareveButton(
                        title: S.of(context).done,
                        onTap: () => controller.sendPhoneNumber(),
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
    );
  }
}
