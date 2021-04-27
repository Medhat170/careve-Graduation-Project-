import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/modules/awareness/controllers/awareness_controller.dart';
import 'package:careve/app/modules/medical_records/controllers/medical_records_controller.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RecordImageHandler extends GetView<MedicalRecordsController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).diagnosis,
            style: TextStyle(
              color: ColorUtil.mediumGrey,
              fontSize: 60.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Obx(
            () => Row(
              children: [
                Container(
                  width: 400.w,
                  height: 300.w,
                  decoration: BoxDecoration(
                    borderRadius: AppUtil.borderRadius,
                    color: ColorUtil.whiteColor,
                    border: Border.all(
                      color: ColorUtil.lightGrey,
                    ),
                  ),
                  child: controller.uploadedImage.value != null
                      ? ClipRRect(
                          borderRadius: AppUtil.borderRadius,
                          child: Image.file(
                            controller.uploadedImage.value,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: ColorUtil.mediumGrey,
                              size: 20.0,
                            ),
                            onPressed: () async => controller.uploadedImage(
                              (await AppUtil.pickFiles(
                                fileType: FileType.image,
                              ))
                                  ?.first,
                            ),
                          ),
                        ),
                ),
                const Spacer(),
                if (controller.uploadedImage.value != null)
                  CareveButton.icon(
                    width: 400.w,
                    height: 100.w,
                    icon: Icon(
                      Icons.clear_rounded,
                      color: ColorUtil.errorColor,
                      size: 16.0,
                    ),
                    title: S.of(context).clear,
                    textColor: ColorUtil.errorColor,
                    backgroundColor: Colors.transparent,
                    borderColor: ColorUtil.errorColor,
                    onTap: () => controller.uploadedImage.nil(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
