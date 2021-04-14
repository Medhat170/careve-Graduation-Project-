import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:get/get.dart';

class DaysComponents extends StatelessWidget {
  final int index;

  const DaysComponents({
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final weekDays = <String>[
      S.current.sat,
      S.current.sun,
      S.current.mon,
      S.current.tue,
      S.current.wed,
      S.current.thu,
      S.current.fri,
    ];
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).days,
            style: TextStyle(
              fontSize: 40.sp,
              color: ColorUtil.mediumGrey,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ...List.generate(
            weekDays.length,
            (dayIndex) => Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 2.5,
                horizontal: 10.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      weekDays[dayIndex],
                      style: TextStyle(
                        fontSize: 34.sp,
                        color: ColorUtil.blackColor,
                      ),
                    ),
                  ),
                  Text(
                    S.of(context).from,
                    style: TextStyle(
                      fontSize: 34.sp,
                      color: ColorUtil.blackColor,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final result = await AppUtil.pickTime();
                        if (result != null) {
                          AuthService.to.changeDay(
                            index,
                            dayIndex,
                            startTime: result,
                          );
                        }
                      },
                      child: Container(
                        height: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: AppUtil.borderRadius,
                          color: Colors.white,
                          border: Border.all(
                            color: ColorUtil.mediumGrey,
                            width: 0.5,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              AuthService.to.userClinics.value.clinics[index]
                                      ?.days[dayIndex]?.startTime
                                      ?.toTimeOnly() ??
                                  '-',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 34.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    S.of(context).to,
                    style: TextStyle(
                      fontSize: 34.sp,
                      color: ColorUtil.blackColor,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        final result = await AppUtil.pickTime();
                        if (result != null) {
                          AuthService.to.changeDay(
                            index,
                            dayIndex,
                            endTime: result,
                          );
                        }
                      },
                      child: Container(
                        height: 30.0,
                        decoration: BoxDecoration(
                          borderRadius: AppUtil.borderRadius,
                          color: Colors.white,
                          border: Border.all(
                            color: ColorUtil.mediumGrey,
                            width: 0.5,
                          ),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              AuthService.to.userClinics.value.clinics[index]
                                      ?.days[dayIndex]?.endTime
                                      ?.toTimeOnly() ??
                                  '-',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 34.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => AuthService.to.removeDay(index, dayIndex),
                    child: Icon(
                      Icons.clear_rounded,
                      color: ColorUtil.errorColor,
                      size: 16.0,
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
