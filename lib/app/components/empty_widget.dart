import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyWidget extends StatelessWidget {
  final String hint;
  final Function extraFunction;

  const EmptyWidget({
    this.hint,
    this.extraFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              PathUtil.emptyLottie,
              width: 500.w,
              height: 500.w,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              S.of(context).noData,
              style: TextStyle(
                fontSize: 60.sp,
                fontWeight: FontWeight.bold,
                color: ColorUtil.primaryColor,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              hint ?? '',
              style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w700,
                color: ColorUtil.mediumGrey,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            if (extraFunction != null && hint == S.current.socketException)
              CareveButton.icon(
                width: 750.w,
                icon: const Icon(
                  FontAwesomeIcons.redoAlt,
                  color: ColorUtil.whiteColor,
                  size: 22.0,
                ),
                title: S.of(context).retry,
                onTap: extraFunction,
              ),
          ],
        ),
      ),
    );
  }
}
