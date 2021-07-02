import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/net_image.dart';
import 'package:careve/app/components/waiting.dart';
import 'package:careve/app/models/all_doctors.dart';
import 'package:careve/app/modules/chat/bindings/chat_binding.dart';
import 'package:careve/app/modules/single_doctor/controllers/single_doctor_controller.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DoctorInfo extends GetView<SingleDoctorController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.3,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: Obx(
          () {
            final Doctor doctor = controller.doctorData;
            return Row(
              children: [
                ClipRRect(
                  borderRadius: AppUtil.borderRadius25,
                  child: doctor?.image != null && doctor.image.isNotEmpty
                      ? NetImage(
                          doctor?.image,
                          width: Get.width * 0.35,
                          height: double.infinity,
                        )
                      : Image.asset(
                          PathUtil.userImage,
                          width: Get.width * 0.35,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor?.name ?? '',
                        style: TextStyle(
                          fontSize: 56.sp,
                          color: ColorUtil.blackColor,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      // Text(
                      //   specialty ?? '',
                      //   style: TextStyle(
                      //     fontSize: 46.sp,
                      //     color: ColorUtil.mediumGrey,
                      //     fontWeight: FontWeight.w600,
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 5.0,
                      // ),
                      if (doctor?.rating != null)
                        Row(
                          children: [
                            SmoothStarRating(
                              allowHalfRating: false,
                              rating: double.tryParse(
                                  doctor?.rating?.toString() ?? '0'),
                              size: 16.0,
                              isReadOnly: true,
                              color: Colors.amber,
                              borderColor: ColorUtil.mediumGrey,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '( ${doctor?.raters ?? 0} )',
                              style: TextStyle(
                                fontSize: 36.sp,
                                color: ColorUtil.mediumGrey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Waiting(
                        loading: controller.isBusy.value,
                        margin: EdgeInsets.zero,
                        child: SizedBox(
                          height: 50.0,
                          child: Row(
                            children: [
                              Expanded(
                                child: CareveButton.icon(
                                  backgroundColor: Colors.white,
                                  icon: const Icon(
                                    FontAwesomeIcons.comment,
                                    size: 22.0,
                                    color: ColorUtil.primaryColor,
                                  ),
                                  onTap: () => Get.offNamed(
                                    Routes.CHAT,
                                    arguments: ChatRouteInputs(
                                      roomId: -1,
                                      receiverID: controller.doctorData?.id,
                                      roomName: doctor?.name,
                                    ),
                                  ),
                                ),
                              ),
                              if (controller?.doctorPhones != null &&
                                  controller.doctorPhones.isNotEmpty) ...[
                                const SizedBox(
                                  width: 7.5,
                                ),
                                Expanded(
                                  child: CareveButton.icon(
                                    backgroundColor: Colors.white,
                                    icon: const Icon(
                                      FontAwesomeIcons.phone,
                                      size: 22.0,
                                      color: ColorUtil.primaryColor,
                                    ),
                                    onTap: () => AppUtil.callPhone(
                                      context,
                                      phoneNumbers: controller.doctorPhones,
                                    ),
                                  ),
                                ),
                              ],
                              if (controller?.doctorAddresses != null &&
                                  controller.doctorAddresses.isNotEmpty) ...[
                                const SizedBox(
                                  width: 7.5,
                                ),
                                Expanded(
                                  child: CareveButton.icon(
                                    backgroundColor: Colors.white,
                                    icon: const Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 22.0,
                                      color: ColorUtil.primaryColor,
                                    ),
                                    onTap: () => AppUtil.openMapsSheet(
                                      context,
                                      addresses: controller?.doctorAddresses,
                                    ),
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
