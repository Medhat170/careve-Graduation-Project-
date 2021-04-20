import 'package:careve/app/utilities/path_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PosterView extends StatelessWidget {
  final String url;

  const PosterView({
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.5)),
      elevation: 5.0,
      child: url == null
          ? Image.asset(
              PathUtil.logoIcon,
              height: 200,
              width: Get.width,
            )
          : Image.network(
              url,
              height: 200,
              width: Get.width,
            ),
    );
  }
}
