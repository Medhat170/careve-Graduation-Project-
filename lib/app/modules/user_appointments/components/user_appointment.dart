import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserAppointment extends StatelessWidget {
  final String doctorName;
  final String address;
  final DateTime date;
  final String telephoneNumber;
  final String specialty;

  const UserAppointment({
    @required this.doctorName,
    @required this.address,
    @required this.date,
    @required this.telephoneNumber,
    @required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    final isDoc = AuthService.to.isDoc?.value;
    final int duration = date.difference(DateTime.now()).inDays;
    return Card(
      elevation: 6.5,
      color: ColorUtil.lightGrey,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
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
                        ? date.toTimeOnly()
                        : date.toLongUserString() ?? '',
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
                CareveButton(
                  title: S.of(context).cancel,
                  height: 70.w,
                  width: 200.w,
                  backgroundColor: Colors.transparent,
                  borderColor: ColorUtil.primaryColor,
                  textColor: ColorUtil.primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              doctorName ?? '',
              style: TextStyle(
                color: ColorUtil.blackColor,
                fontSize: 60.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            if (specialty != null && !isDoc)
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.userMd,
                    color: ColorUtil.primaryColor,
                    size: 40.sp,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(
                      specialty,
                      style: TextStyle(
                        color: ColorUtil.mediumGrey,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            if (address != null)
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
                      address,
                      style: TextStyle(
                        color: ColorUtil.mediumGrey,
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (!isDoc)
                    CareveButton(
                      title: S.of(context).go,
                      height: 70.w,
                      width: 200.w,
                      onTap: () => AppUtil.openMapsSheet(
                        latitude: 31.22222222,
                        longitude: 31.322332323,
                      ),
                    ),
                ],
              ),
            if (telephoneNumber != null)
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
                      telephoneNumber,
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
                        '01020304050',
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
