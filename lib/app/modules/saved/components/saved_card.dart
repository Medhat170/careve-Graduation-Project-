import 'package:careve/app/modules/awareness_info/controllers/awareness_info_controller.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:get/get.dart';

class SavedCard extends StatelessWidget {
  final String title;
  final String image;
  final DateTime dateTime;
  final AwarenessType type;

  const SavedCard({
    this.image,
    @required this.title,
    @required this.dateTime,
    @required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.AWARENESS_INFO,
        arguments: type,
      ),
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: AppUtil.borderRadius,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5.0,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15.0,
          ),
          child: Row(
            children: [
              if (image != null) ...[
                Card(
                  color: ColorUtil.whiteColor,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: AppUtil.borderRadius,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      PathUtil.logoIcon,
                      height: 250.w,
                      width: 250.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (dateTime != null)
                          Expanded(
                            child: Text(
                              dateTime.toShortUserString(),
                              style: TextStyle(
                                color: ColorUtil.mediumGrey,
                                fontWeight: FontWeight.w500,
                                fontSize: 36.sp,
                              ),
                            ),
                          ),
                        IconButton(
                          icon: const Icon(
                            FontAwesomeIcons.solidWindowClose,
                            color: ColorUtil.mediumGrey,
                            size: 20.0,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Text(
                      title ?? '',
                      style: TextStyle(
                        color: ColorUtil.blackColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 50.sp,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
