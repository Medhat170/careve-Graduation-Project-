import 'package:careve/app/components/animatedListHandler.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/modules/user_profile/component/profile_data.dart';
import 'package:careve/app/modules/user_profile/component/user_feature.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/user_profile_controller.dart';

class UserProfileView extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
          body: AnimatedListHandler(
            shrinkWrap: true,
            noScroll: true,
            children: [
              ProfileData(),
              const SizedBox(
                height: 5.0,
              ),
              UserFeature(
                iconData: FontAwesomeIcons.solidComments,
                title: S.of(context).messages,
                iconColor: Colors.amber,
                trailingCount: 2,
                onTap: () => Get.toNamed(Routes.ROOMS),
              ),
              UserFeature(
                iconData: FontAwesomeIcons.calendarCheck,
                title: S.of(context).appointments,
                iconColor: Colors.teal,
                onTap: () => Get.toNamed(Routes.USER_APPOINTMENTS),
              ),
              UserFeature(
                iconData: FontAwesomeIcons.solidBookmark,
                title: S.of(context).saved,
                iconColor: Colors.purple,
                onTap: () => Get.toNamed(Routes.SAVED),
              ),
              UserFeature(
                iconData: FontAwesomeIcons.hospital,
                title: S.of(context).hospitals,
                iconColor: Colors.brown,
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
                onTap: () async => await AuthService.to.signOut(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}