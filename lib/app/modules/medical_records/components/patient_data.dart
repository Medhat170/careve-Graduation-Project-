import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/net_image.dart';
import 'package:careve/app/models/user.dart';
import 'package:careve/app/modules/chat/bindings/chat_binding.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PatientDataCard extends StatelessWidget {
  final User patientData;

  const PatientDataCard({
    this.patientData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorUtil.whiteColor,
      elevation: 6.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 10.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppUtil.borderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 5.0,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: AppUtil.borderRadius,
              child: patientData?.image != null && patientData.image.isNotEmpty
                  ? NetImage(
                      patientData.image,
                      width: 300.w,
                      height: 300.w,
                    )
                  : Image.asset(
                      PathUtil.articlesImage,
                      width: 300.w,
                      fit: BoxFit.cover,
                    ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (patientData?.name != null)
                    Text(
                      '${S.of(context).name} : ${patientData?.name}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40.sp,
                        color: ColorUtil.primaryColor,
                      ),
                    ),
                  if (patientData?.bloodType != null)
                    Text(
                      '${S.of(context).bloodType} : ${patientData?.bloodType}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40.sp,
                        color: ColorUtil.primaryColor,
                      ),
                    ),
                  if (patientData?.address != null)
                    Text(
                      '${S.of(context).address} : ${patientData?.address}',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40.sp,
                        color: ColorUtil.primaryColor,
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CareveButton(
                        title: S.of(context).chat,
                        height: 80.w,
                        width: 300.w,
                        onTap: () => Get.toNamed(
                          Routes.CHAT,
                          arguments: ChatRouteInputs(
                            roomId: 0,
                            receiverID: int.tryParse(patientData?.id),
                            roomName: patientData?.name,
                            conId:
                                'u${patientData?.id}d${AuthService.to.user?.value?.id}',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
