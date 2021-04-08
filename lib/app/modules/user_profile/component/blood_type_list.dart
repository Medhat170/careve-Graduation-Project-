import 'package:careve/app/components/appDropDownMenu.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodTypeList extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    List<String> bloodTypesList = controller.bloodTypesRef.toList();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        textDirection: AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              S.of(context).bloodType,
              style: TextStyle(
                fontSize: 40.sp,
                color: ColorUtil.mediumGrey,
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => AppDropDownMenu(
                listElements: bloodTypesList,
                onChanged: (String value) {
                  controller.bloodType(value);
                },
                hintText: controller.bloodType?.value == null
                    ? '-'
                    : controller.bloodType?.value ?? '-',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
