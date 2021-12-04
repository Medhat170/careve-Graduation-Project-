import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/waiting.dart';
import 'package:careve/app/modules/single_doctor/controllers/single_doctor_controller.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:get/get.dart';
import 'package:careve/app/components/extensions.dart';

class AppointmentItem extends StatelessWidget {
  final DateTime date;
  final String day;

  const AppointmentItem({
    @required this.date,
    this.day,
  });

  @override
  Widget build(BuildContext context) {
    final allLike = SingleDoctorController.to.allLike(day);
    final String actualDay = AuthService.to.actualDay(day);
    return GestureDetector(
      onTap: () {
        AppUtil.showAlertDialog(
          title: S.of(context).chooseWeek,
          child: Column(
            children: [
              Text(
                date?.toTimeWithAmPmFormat() ?? '',
                style: TextStyle(
                  color: ColorUtil.blackColor,
                  fontSize: 60.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...allLike.map(
                (e) {
                  final shownDate = e.toNumbersFormat(
                    locale: const Locale('en', 'US').toString(),
                  );
                  final sendDateTime = '$shownDate ${date?.toTimeOnly(
                    locale: const Locale('en', 'US').toString(),
                  )}';
                  return Obx(
                    () => Waiting(
                      loading: SingleDoctorController.to.loadingId.value ==
                          sendDateTime,
                      margin: const EdgeInsets.all(10.0),
                      child: AppButton(
                        title: '$actualDay    $shownDate' ?? '',
                        backgroundColor: Colors.transparent,
                        borderColor: ColorUtil.primaryColor,
                        margin: const EdgeInsets.all(10.0),
                        textColor: ColorUtil.primaryColor,
                        onTap: () {
                          print('DateTime booked : $sendDateTime');
                          SingleDoctorController.to.addNewAppointment(
                            sendDateTime,
                          );
                        },
                      ),
                    ),
                  );
                },
              ).toList(),
            ],
          ),
        );
      },
      child: Card(
        elevation: 6.5,
        color: ColorUtil.lightGrey,
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: AppUtil.borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                color: ColorUtil.primaryColor,
                size: 24.0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  date?.toTimeWithAmPmFormat() ?? '',
                  style: TextStyle(
                    color: ColorUtil.blackColor,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorUtil.primaryColor,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
