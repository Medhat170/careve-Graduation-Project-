import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CVComponent extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).cv,
            style: TextStyle(
              color: ColorUtil.mediumGrey,
              fontSize: 40.sp,
            ),
          ),
          if (controller.cv.value == null)
            Row(
              textDirection:
                  AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
              children: <Widget>[
                Expanded(
                  child: Text(
                    S.of(context).attachCV,
                    style: TextStyle(
                      color: ColorUtil.mediumGrey,
                      fontSize: 34.sp,
                    ),
                  ),
                ),
                CareveButton.icon(
                  height: 130.w,
                  width: 130.w,
                  margin: EdgeInsets.zero,
                  icon: Icon(
                    FontAwesomeIcons.paperclip,
                    color: ColorUtil.primaryColor,
                    size: 50.sp,
                  ),
                  backgroundColor: ColorUtil.lightGrey,
                  onTap: () async => controller.cv(
                    (await AppUtil.pickFiles())?.first,
                  ),
                ),
              ],
            ),
          if (controller.cv.value != null)
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.file(
                    controller.cv.value,
                    width: Get.width / 2,
                    height: Get.width / 2,
                  ),
                ),
                Positioned(
                  top: 5.0,
                  right: AppUtil.isLtr ? 5.0 : null,
                  left: AppUtil.isLtr ? null : 5.0,
                  child: GestureDetector(
                    onTap: () => controller.cv.nil(),
                    child: Icon(
                      Icons.remove_circle,
                      color: ColorUtil.errorColor,
                      size: 22.0,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
