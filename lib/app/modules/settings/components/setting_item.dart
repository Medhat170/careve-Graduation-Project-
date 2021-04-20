import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingItem extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Widget trailing;

  const SettingItem({
    this.title,
    this.onPressed,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: ColorUtil.mediumGrey,
                      fontSize: 46.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                if (trailing != null) trailing,
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              color: ColorUtil.mediumGrey,
            ),
          ],
        ),
      ),
    );
  }
}
