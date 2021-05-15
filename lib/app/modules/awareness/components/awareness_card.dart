import 'package:careve/app/components/net_image.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careve/app/components/extensions.dart';

class AwarenessCard extends AwarenessCardRef {
  AwarenessCard({
    Widget child,
    String title,
    String auther,
    DateTime dateTime,
    Function onTap,
    double elevation,
    EdgeInsets margin,
  }) : super(
          child ??
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          auther ?? '',
                          style: TextStyle(
                            color: ColorUtil.mediumGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 36.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (dateTime != null)
                        Text(
                          dateTime.toShortUserString(),
                          style: TextStyle(
                            color: ColorUtil.mediumGrey,
                            fontWeight: FontWeight.w500,
                            fontSize: 36.sp,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
          onTap: onTap,
          borderRadius: AppUtil.borderRadius,
          margin: margin,
          elevation: elevation,
        );

  factory AwarenessCard.image({
    @required String image,
    String title,
    Function onTap,
    EdgeInsets margin,
  }) = _AwarenessCardWithImage;
}

class _AwarenessCardWithImage extends AwarenessCard {
  _AwarenessCardWithImage({
    @required String image,
    @required String title,
    Function onTap,
    EdgeInsets margin,
  }) : super(
          child: Row(
            children: [
              Card(
                color: ColorUtil.whiteColor,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: AppUtil.borderRadius,
                ),
                child: ClipRRect(
                  borderRadius: AppUtil.borderRadius,
                  child: image != null && image.isNotEmpty
                      ? NetImage(
                          image,
                          width: 90.0,
                          height: 90.0,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          PathUtil.logoIcon,
                          width: 90.0,
                          height: 90.0,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  title ?? '',
                  style: TextStyle(
                    color: ColorUtil.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 50.sp,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          onTap: onTap,
          margin: margin,
          elevation: 0.0,
        );
}

class AwarenessCardRef extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final double elevation;
  final EdgeInsets margin;
  final BorderRadius borderRadius;

  const AwarenessCardRef(
    this.child, {
    @required this.onTap,
    this.borderRadius,
    this.elevation,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onTap();
      },
      child: Card(
        color: Colors.white,
        elevation: elevation ?? 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        margin: margin ??
            const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 5.0,
            ),
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 15.0,
          ),
          child: child,
        ),
      ),
    );
  }
}
