import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/waiting.dart';
import 'package:careve/app/models/doctor_clinics_appointments.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ClinicCard extends StatelessWidget {
  final Clinic clinicData;
  final RxInt loadingId;
  final Function removeFunction;
  final Function onTap;

  const ClinicCard({
    this.clinicData,
    this.loadingId,
    this.removeFunction,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const margin = EdgeInsets.symmetric(
      horizontal: 15.0,
      vertical: 10.0,
    );
    return Waiting(
      margin: margin,
      loading: loadingId?.value == clinicData?.id && clinicData?.id != null,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: ColorUtil.whiteColor,
          elevation: 3.0,
          margin: margin,
          shape: RoundedRectangleBorder(
            borderRadius: AppUtil.borderRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: clinicData?.address?.title == null
                ? Text(
                    S.of(context).pressToAddClinic,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 46.sp,
                      color: ColorUtil.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              clinicData?.address?.title ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 46.sp,
                                color: ColorUtil.primaryColor,
                              ),
                            ),
                          ),
                          if (removeFunction != null)
                            CareveButton(
                              title: S.of(context).delete,
                              height: 70.w,
                              width: 200.w,
                              backgroundColor: Colors.transparent,
                              borderColor: ColorUtil.primaryColor,
                              textColor: ColorUtil.primaryColor,
                              onTap: () => AppUtil.showAlertDialog(
                                title: S.of(context).areYouSure,
                                body: S.of(context).removeClinic(
                                    clinicData?.address?.title ?? ''),
                                enableCancel: true,
                                confirmText: S.of(context).confirm,
                                onConfirm: removeFunction,
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.mapMarkerAlt,
                                color: ColorUtil.primaryColor,
                                size: 50.sp,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(
                                  clinicData?.address?.formattedAddress ?? '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 46.sp,
                                    color: ColorUtil.mediumGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Text(
                              '${S.of(context).days} :',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 40.sp,
                                color: ColorUtil.blackColor,
                              ),
                            ),
                          ),
                          if (clinicData?.days != null &&
                              clinicData.days.isNotEmpty)
                            ...clinicData.days.map(
                              (d) {
                                final dayData =
                                    '${AuthService.to.actualDay(d?.day)} || ${S.of(context).from} : ( ${d?.startTime} ) , ${S.of(context).to} : ( ${d?.endTime} )';
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Text(
                                    dayData ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 40.sp,
                                      color: ColorUtil.blackColor,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
