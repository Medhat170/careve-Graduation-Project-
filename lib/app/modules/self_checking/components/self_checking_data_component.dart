import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/models/self_checking_data.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelfCheckingDataComponent extends StatelessWidget {
  final SelfCheckingData selfCheckingData;

  const SelfCheckingDataComponent({
    @required this.selfCheckingData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: AnimatedListHandler(
        children: [
          Text(
            selfCheckingData?.title ?? "",
            style: TextStyle(
              color: ColorUtil.primaryColor,
              fontSize: 46.sp,
              fontWeight: FontWeight.w800,
            ),
            textAlign: TextAlign.start,
          ),
          ...selfCheckingData.subTitles
              .map(
                (sub) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    sub ?? '',
                    style: TextStyle(
                      color: ColorUtil.blackColor,
                      fontSize: 40.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              )
              .toList(),
          const SizedBox(
            height: 15.0,
          ),
          if (selfCheckingData?.highlightTitle != null)
            Text(
              selfCheckingData.highlightTitle,
              style: TextStyle(
                color: ColorUtil.primaryColor,
                fontSize: 44.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.start,
            ),
          if (selfCheckingData?.highlights != null)
            Wrap(
              children: selfCheckingData.highlights
                  .map(
                    (txt) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        txt ?? '',
                        style: TextStyle(
                          color: ColorUtil.blackColor,
                          fontSize: 38.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  )
                  .toList(),
            ),
          if (selfCheckingData?.images != null)
            Wrap(
              children: selfCheckingData.images
                  .map(
                    (img) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        img,
                        height: 250.w,
                        width: 250.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
