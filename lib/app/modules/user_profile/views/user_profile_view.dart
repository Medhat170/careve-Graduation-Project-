import 'package:careve/app/components/animatedListHandler.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/modules/user_profile/component/profile_data.dart';
import 'package:careve/app/modules/user_profile/component/user_feature.dart';
import 'package:careve/app/utilities/colorUtil.dart';
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
              UserFeature(
                iconData: FontAwesomeIcons.solidComments,
                title: 'Messages',
                iconColor: Colors.amber,
                onTap: null,
              ),
              UserFeature(
                iconData: FontAwesomeIcons.solidBookmark,
                title: 'Saved',
                iconColor: Colors.purple,
                onTap: null,
              ),
              UserFeature(
                iconData: FontAwesomeIcons.cogs,
                title: 'Setting',
                iconColor: ColorUtil.mediumGrey,
                onTap: null,
              ),
              UserFeature(
                iconData: FontAwesomeIcons.signOutAlt,
                title: 'Log Out',
                iconColor: Colors.deepPurpleAccent,
                onTap: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
