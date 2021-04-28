import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/waiting.dart';
import 'package:careve/app/models/all_appointments.dart';
import 'package:careve/app/modules/user_appointments/controllers/user_appointments_controller.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UserAppointment extends GetView<UserAppointmentsController> {
  final Appointment appointment;

  const UserAppointment({
    @required this.appointment,
  });

  @override
  Widget build(BuildContext context) {
    final isDoc = AuthService.to.isDoc?.value;
    final int duration = appointment?.date?.difference(DateTime.now())?.inDays;
    const margin = EdgeInsets.symmetric(
      horizontal: 10.0,
      vertical: 10.0,
    );
    return Obx(
      () => Waiting(
        loading: (appointment?.id ?? -1) == controller.loadingId?.value,
        margin: margin,
        borderRadius: AppUtil.borderRadius,
        child: GestureDetector(
          onTap: () => Get.toNamed(
            Routes.MEDICAL_RECORDS,
            arguments: appointment?.patientId,
          ),
          child: Card(
            elevation: 6.5,
            color: ColorUtil.lightGrey,
            margin: margin,
            shape: RoundedRectangleBorder(
              borderRadius: AppUtil.borderRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          duration == 0
                              ? appointment?.date?.toTimeWithAmPmFormat()
                              : appointment?.date?.toLongUserString() ?? '',
                          style: duration == 0
                              ? TextStyle(
                                  color: ColorUtil.errorColor,
                                  fontSize: 44.sp,
                                  fontWeight: FontWeight.bold,
                                )
                              : TextStyle(
                                  color: ColorUtil.blackColor,
                                  fontSize: 38.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                        ),
                      ),
                      if (!controller.isDoc)
                        CareveButton(
                          title: S.of(context).cancel,
                          height: 70.w,
                          width: 200.w,
                          backgroundColor: Colors.transparent,
                          borderColor: ColorUtil.primaryColor,
                          textColor: ColorUtil.primaryColor,
                          onTap: () => AppUtil.showAlertDialog(
                            title: S.of(context).areYouSure,
                            body: S.of(context).cancelAppointment,
                            enableCancel: true,
                            confirmText: S.of(context).confirm,
                            onConfirm: () => controller.cancelAppointment(
                              appointment?.id,
                              isFinished:
                                  appointment?.date?.isBefore(DateTime.now()),
                              docId: appointment?.docId,
                              docName: appointment?.docName,
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (!isDoc) ...[
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      appointment?.docName ?? '',
                      style: TextStyle(
                        color: ColorUtil.blackColor,
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    if (appointment?.address != null)
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            color: ColorUtil.primaryColor,
                            size: 40.sp,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              appointment?.address?.formattedAddress ?? '',
                              style: TextStyle(
                                color: ColorUtil.mediumGrey,
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (!isDoc &&
                              appointment?.address?.lat != null &&
                              appointment?.address?.long != null)
                            CareveButton(
                              title: S.of(context).go,
                              height: 70.w,
                              width: 200.w,
                              onTap: () => AppUtil.openMap(
                                latitude: appointment?.address?.lat,
                                longitude: appointment?.address?.long,
                              ),
                            ),
                        ],
                      ),
                    if (appointment?.phone != null)
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.phone,
                            color: ColorUtil.primaryColor,
                            size: 40.sp,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              appointment?.phone,
                              style: TextStyle(
                                color: ColorUtil.mediumGrey,
                                fontSize: 40.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          CareveButton(
                            title: S.of(context).call,
                            height: 70.w,
                            width: 200.w,
                            onTap: () => AppUtil.callPhone(
                              context,
                              phoneNumbers: [
                                appointment?.phone,
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
