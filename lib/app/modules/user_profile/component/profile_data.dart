import 'package:careve/app/components/net_image.dart';
import 'package:careve/app/models/user.dart';
import 'package:careve/app/modules/user_profile/controllers/user_profile_controller.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileData extends GetView<UserProfileController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final User userData = controller.userData?.value;
        return Stack(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 20.0,
                right: 20.0,
                bottom: 20.0,
              ),
              color: ColorUtil.primaryColor,
              child: Row(
                children: [
                  Hero(
                    tag: 'profile',
                    child: Material(
                      elevation: 8.0,
                      shape: const CircleBorder(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:
                            userData?.image != null && userData.image.isNotEmpty
                                ? NetImage(
                                    userData?.image,
                                    height: 180.w,
                                    width: 180.w,
                                  )
                                : Image.asset(
                                    PathUtil.userImage,
                                    height: 180.w,
                                    width: 180.w,
                                    fit: BoxFit.cover,
                                  ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (userData?.name != null)
                          Text(
                            userData?.name ?? '-',
                            style: TextStyle(
                              fontSize: 60.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorUtil.whiteColor,
                            ),
                          ),
                        if (userData?.email != null)
                          Text(
                            userData?.email ?? '-',
                            style: TextStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorUtil.whiteColor,
                            ),
                          ),
                        if (userData?.address != null)
                          Text(
                            userData?.address,
                            style: TextStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorUtil.whiteColor,
                            ),
                          ),
                        if (userData?.phone != null)
                          Text(
                            userData?.phone ?? '-',
                            style: TextStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorUtil.whiteColor,
                            ),
                          ),
                        if (userData?.bloodType != null)
                          Text(
                            userData?.bloodType ?? '-',
                            style: TextStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700,
                              color: ColorUtil.whiteColor,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                      size: 20.0,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      FontAwesomeIcons.userEdit,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    onPressed: () => Get.toNamed(Routes.EDIT_PROFILE),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
