import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthDateHandler extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              S.of(context).birthDate,
              style: TextStyle(
                fontSize: 40.sp,
                color: ColorUtil.mediumGrey,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: AppUtil.borderRadius,
                border: Border.all(
                  color: ColorUtil.lightGrey,
                  width: 1.0,
                ),
              ),
              height: 65.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: FittedBox(
                        child: Text(
                          controller.dateOfBirth?.value == null
                              ? '-'
                              : controller.dateOfBirth.value
                                  .toShortUserString(),
                          style: TextStyle(
                            fontSize: 30.sp,
                            color: ColorUtil.mediumGrey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: controller.isBusy.value
                        ? () {}
                        : () async {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            controller.dateOfBirth(await AppUtil.pickDate());
                          },
                    child: Icon(
                      FontAwesomeIcons.calendarAlt,
                      color: ColorUtil.mediumGrey,
                      size: 50.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
