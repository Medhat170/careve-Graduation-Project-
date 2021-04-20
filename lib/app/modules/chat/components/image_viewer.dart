import 'package:careve/app/components/loading.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageViewer extends StatelessWidget {
  final String image;
  final int id;

  const ImageViewer({
    @required this.image,
    @required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorUtil.primaryColor,
              size: 55.sp,
            ),
            onPressed: () => Get.back(result: true),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                FontAwesomeIcons.arrowAltCircleDown,
                color: Colors.black,
              ),
              onPressed: () {},
              //     await ChatController.to.downloadFile(image, basename(image)),
            )
          ],
        ),
        body: image == null
            ? Loading()
            : Center(
                child: Hero(
                  tag: id.toString(),
                  child: Image.network(
                    image,
                  ),
                ),
              ),
      ),
    );
  }
}
