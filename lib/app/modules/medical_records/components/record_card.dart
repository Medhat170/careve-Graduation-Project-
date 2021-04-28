import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/net_image.dart';
import 'package:careve/app/components/waiting.dart';
import 'package:careve/app/modules/medical_records/controllers/medical_records_controller.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:get/get.dart';

class RecordCard extends StatelessWidget {
  final DateTime dateTime;
  final String title;
  final String results;
  final String image;
  final int id;

  const RecordCard({
    this.dateTime,
    this.title,
    this.results,
    this.image,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    const margin = EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 10.0,
    );
    final isDoc = AuthService.to.isDoc.value;
    return Obx(
      () => Waiting(
        margin: margin,
        loading: MedicalRecordsController.to.canceledId.value == id,
        child: GestureDetector(
          onTap: () {
            if (!isDoc) {
              MedicalRecordsController.to.editingRecord(true);
              MedicalRecordsController.to.title.text = title;
              MedicalRecordsController.to.result.text = results;
              MedicalRecordsController.to.recordId(id);
              Get.toNamed(Routes.ADD_EDIT_RECORD);
            }
          },
          child: Card(
            color: ColorUtil.whiteColor,
            elevation: 3.0,
            margin: margin,
            shape: RoundedRectangleBorder(
              borderRadius: AppUtil.borderRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 5.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (dateTime != null)
                        Expanded(
                          child: Text(
                            dateTime?.toLongUserString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 46.sp,
                              color: ColorUtil.mediumGrey,
                            ),
                          ),
                        ),
                      if (!isDoc)
                        CareveButton(
                          title: S.of(context).delete,
                          height: 70.w,
                          width: 200.w,
                          backgroundColor: Colors.transparent,
                          borderColor: ColorUtil.primaryColor,
                          textColor: ColorUtil.primaryColor,
                          onTap: () => AppUtil.showAlertDialog(
                            title: S.of(context).areYouSure,
                            body: S.of(context).removeRecord,
                            enableCancel: true,
                            confirmText: S.of(context).confirm,
                            onConfirm: () =>
                                MedicalRecordsController.to.deleteRecord(
                              id,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: AppUtil.borderRadius,
                        child: image != null && image.isNotEmpty
                            ? NetImage(
                                image,
                                width: 500.w,
                              )
                            : Image.asset(
                                PathUtil.articlesImage,
                                width: 500.w,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 46.sp,
                                color: ColorUtil.primaryColor,
                              ),
                            ),
                            Text(
                              results ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 46.sp,
                                color: ColorUtil.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
