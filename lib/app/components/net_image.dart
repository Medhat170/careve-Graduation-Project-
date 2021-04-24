import 'package:cached_network_image/cached_network_image.dart';
import 'package:careve/app/components/loading.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const imagesUrl = 'https://laravelbreast.000webhostapp.com/public/images/';

class NetImage extends CachedNetworkImage {
  NetImage(
    String src, {
    double height,
    double width,
    BoxFit fit,
  }) : super(
          imageUrl: imagesUrl + src,
          width: width,
          height: height,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) => Loading(),
          errorWidget: (context, url, error) => Center(
            child: FittedBox(
              child: Text(
                S.of(context).httpException,
                style: TextStyle(
                  color: ColorUtil.errorColor,
                  fontSize: 30.sp,
                ),
              ),
            ),
          ),
        );
}
