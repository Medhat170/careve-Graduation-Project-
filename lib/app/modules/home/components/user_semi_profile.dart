import 'package:avatar_glow/avatar_glow.dart';
import 'package:careve/app/components/badge.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSemiProfile extends StatelessWidget {
  final Widget child;

  const UserSemiProfile({
    @required this.child,
  }) : assert(child != null);

  @override
  Widget build(BuildContext context) {
    final userData = AuthService.to.user?.value;
    final height =
        Get.height - Get.mediaQuery.padding.top - Get.mediaQuery.padding.bottom;
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: height,
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
            height: height * 0.4,
            width: Get.width,
            color: ColorUtil.primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).welcomeBack,
                        style: TextStyle(
                          fontSize: 70.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorUtil.whiteColor,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        userData?.name ?? '',
                        style: TextStyle(
                          fontSize: 60.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorUtil.whiteColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
                Badge(
                  title: '2',
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.USER_PROFILE),
                    child: AvatarGlow(
                      endRadius: 150.w,
                      child: Hero(
                        tag: 'profile',
                        child: Material(
                          elevation: 8.0,
                          shape: const CircleBorder(),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 90.w,
                            child: userData?.image == null ||
                                    userData.image.isEmpty
                                ? Image.asset(
                                    PathUtil.userImage,
                                    height: 80.w,
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    userData?.image,
                                    height: 80.w,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          top: (height * 0.4) - 50.0,
          child: child,
        ),
      ],
    );
  }
}
