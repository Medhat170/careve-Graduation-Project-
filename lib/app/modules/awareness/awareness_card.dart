import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
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
    EdgeInsets margin,
  }) : super(
          child ??
              Column(
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
                elevation: 2.5,
                shape: RoundedRectangleBorder(
                  borderRadius: AppUtil.borderRadius,
                ),
                child: image != null
                    ? Image.network(
                        image,
                        height: 90.0,
                        width: 90.0,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        PathUtil.logoIcon,
                        height: 80.0,
                        width: 80.0,
                        fit: BoxFit.cover,
                      ),
              ),
              const SizedBox(
                width: 20.0,
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
        );
}

class AwarenessCardRef extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final EdgeInsets margin;
  final BorderRadius borderRadius;

  const AwarenessCardRef(
    this.child, {
    @required this.onTap,
    this.borderRadius,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        onTap();
      },
      child: Card(
        color: Colors.white,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        margin: margin ??
            EdgeInsets.symmetric(
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
