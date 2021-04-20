import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/user_appointments/components/user_appointment.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/user_appointments_controller.dart';

class UserAppointmentsView extends GetView<UserAppointmentsController>
    with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        children: [
          customAppBar(
            S.of(context).appointments,
            enableBack: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: AnimatedListHandler(
                children: [
                  if (controller.today != null) ...[
                    Text(
                      S.of(context).today,
                      style: TextStyle(
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.blackColor,
                      ),
                    ),
                    ...controller.today
                        .map(
                          (e) => UserAppointment(
                            doctorName: 'Dr:Ahmed mohamed',
                            date: e,
                            telephoneNumber: '01020304050',
                            address: 'Mansoura',
                            specialty: 'breast cancer specialist',
                          ),
                        )
                        .toList(),
                  ],
                  if (controller.earlier != null) ...[
                    Text(
                      S.of(context).earlier,
                      style: TextStyle(
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.blackColor,
                      ),
                    ),
                    ...controller.earlier
                        .map(
                          (e) => UserAppointment(
                            doctorName: 'Dr:Ahmed mohamed',
                            date: e,
                            telephoneNumber: '01020304050',
                            address: 'Mansoura',
                            specialty: 'breast cancer specialist',
                          ),
                        )
                        .toList(),
                  ],
                  if (controller.today != null) ...[
                    Text(
                      S.of(context).later,
                      style: TextStyle(
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorUtil.blackColor,
                      ),
                    ),
                    ...controller.later
                        .map(
                          (e) => UserAppointment(
                            doctorName: 'Dr:Ahmed mohamed',
                            date: e,
                            telephoneNumber: '01020304050',
                            address: 'Mansoura',
                            specialty: 'breast cancer specialist',
                          ),
                        )
                        .toList(),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
