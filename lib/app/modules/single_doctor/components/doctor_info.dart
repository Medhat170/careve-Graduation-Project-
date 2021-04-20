import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/modules/chat/bindings/chat_binding.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorInfo extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;
  final double rate;
  final String id;

  const DoctorInfo({
    this.name,
    this.specialty,
    this.image,
    this.rate,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 20.0,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: AppUtil.borderRadius25,
              child: Image.asset(
                PathUtil.hospitalsImage,
                fit: BoxFit.cover,
                width: Get.width * 0.35,
                height: double.infinity,
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
                    name ?? '',
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
                  Text(
                    specialty ?? '',
                    style: TextStyle(
                      fontSize: 46.sp,
                      color: ColorUtil.mediumGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  if (rate != null)
                    RatingBar(
                      rating: rate,
                      icon: const Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.grey,
                      ),
                      spacing: 2.0,
                      size: 5,
                      onRatingCallback:
                          (double value, ValueNotifier<bool> isIndicator) {
                        print('Number of stars-->  $value');
                        isIndicator.value = true;
                      },
                      color: Colors.amber,
                    ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  SizedBox(
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
                            onTap: () => Get.toNamed(
                              Routes.CHAT,
                              arguments: ChatRouteInputs(
                                roomId: 0,
                                roomName: 'Doctor_name',
                              ),
                            ),
                          ),
                        ),
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
                              phoneNumbers: [
                                '01020304050',
                              ],
                            ),
                          ),
                        ),
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
                              latitude: 31.22222222,
                              longitude: 31.322332323,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
