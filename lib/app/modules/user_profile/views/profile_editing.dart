import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/components/user_image_handler.dart';
import 'package:careve/app/modules/auth/components/auth_input_field.dart';
import 'package:careve/app/modules/user_profile/component/blood_type_list.dart';
import 'package:careve/app/modules/user_profile/component/date_of_birth_handler.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditingView extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Form(
        key: controller.editFormKey,
        child: Obx(() {
          print(controller.dateOfBirth?.value?.toString());
          return ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5.0,
            ),
            children: <Widget>[
              ProfileImageHandler(),
              AuthInputField(
                S.of(context).name,
                controller.name,
                loading: controller.isBusy.value,
                keyBoardType: TextInputType.text,
                validator: const QuickTextValidator().call,
              ),
              AuthInputField(
                S.of(context).email,
                controller.email,
                loading: controller.isBusy.value,
                keyBoardType: TextInputType.emailAddress,
                validator: const QuickTextValidator(
                  isEmail: true,
                ).call,
              ),
              AuthInputField(
                S.of(context).address,
                controller.address,
                loading: controller.isBusy.value,
                keyBoardType: TextInputType.streetAddress,
              ),
              AuthInputField(
                S.of(context).phoneNumber,
                controller.phone,
                loading: controller.isBusy.value,
                keyBoardType: TextInputType.number,
              ),
              BirthDateHandler(),
              BloodTypeList(),
              if (controller.isBusy.value)
                Loading()
              else
                CareveButton(
                  title: S.of(context).edit,
                  onTap: () => controller.editProfile,
                ),
            ],
          );
        }),
      ),
    );
  }
}
