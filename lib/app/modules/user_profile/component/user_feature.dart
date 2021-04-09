import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserFeature extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Color iconColor;
  final Function onTap;
  final int trailingCount;

  UserFeature({
    @required this.iconData,
    @required this.title,
    this.iconColor,
    this.onTap,
    this.trailingCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Row(
              children: [
                Icon(
                  iconData,
                  color: iconColor,
                  size: 22.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 48.sp,
                    ),
                  ),
                ),
                if (trailingCount != null && trailingCount != 0)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: CircleAvatar(
                      backgroundColor: ColorUtil.primaryColor,
                      radius: 12,
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            trailingCount?.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Icon(
                  !AppUtil.isLtr
                      ? Icons.keyboard_arrow_left
                      : Icons.keyboard_arrow_right,
                  size: 26.0,
                  color: ColorUtil.mediumGrey,
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: ColorUtil.mediumGrey,
        ),
      ],
    );
  }
}
