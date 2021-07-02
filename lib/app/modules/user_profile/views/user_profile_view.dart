import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/modules/user_profile/component/profile_data.dart';
import 'package:careve/app/modules/user_profile/component/user_feature.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: AnimatedListHandler(
        shrinkWrap: true,
        noScroll: true,
        children: [
          ProfileData(),
          const SizedBox(
            height: 5.0,
          ),
          if (!AuthService.to.isDoc.value)
            UserFeature(
              iconData: FontAwesomeIcons.solidComments,
              title: S.of(context).messages,
              iconColor: Colors.amber,
              onTap: () => Get.toNamed(Routes.ROOMS),
            ),
          if (!AuthService.to.isDoc.value)
            UserFeature(
              iconData: FontAwesomeIcons.calendarCheck,
              title: S.of(context).appointments,
              iconColor: Colors.teal,
              onTap: () => Get.toNamed(Routes.USER_APPOINTMENTS),
            ),
          if (AuthService.to.isDoc.value)
            UserFeature(
              iconData: FontAwesomeIcons.calendarCheck,
              title: S.of(context).editAppointmentsClinics,
              iconColor: Colors.amber,
              onTap: () => Get.toNamed(Routes.DOCTOR_CLINICS),
            ),
          if (!AuthService.to.isDoc.value)
            UserFeature(
              iconData: FontAwesomeIcons.hospital,
              title: S.of(context).hospitals,
              iconColor: Colors.brown,
              onTap: () => AppUtil.openMap(),
            ),
          UserFeature(
            iconData: FontAwesomeIcons.cogs,
            title: S.of(context).settings,
            iconColor: ColorUtil.mediumGrey,
            onTap: () => Get.toNamed(Routes.SETTINGS),
          ),
          UserFeature(
            iconData: FontAwesomeIcons.signOutAlt,
            title: S.of(context).signOut,
            iconColor: Colors.deepPurpleAccent,
            onTap: AuthService.to.signOut,
          ),
        ],
      ),
    );
  }
}
