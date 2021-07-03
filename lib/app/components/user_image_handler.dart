import 'package:careve/app/components/back_button.dart';
import 'package:careve/app/components/net_image.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProfileImageHandler extends GetView<AuthService> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final userData = controller.user?.value;
        Widget imageProvider = Image.asset(
          PathUtil.logoIcon,
          height: 100.0,
          width: 100.0,
          fit: BoxFit.cover,
        );
        if (controller.uploadedImage?.value != null &&
            controller.uploadedImage.value.path.isNotEmpty) {
          print('file');
          imageProvider = Image.file(
            controller.uploadedImage?.value,
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          );
        } else if (userData?.image != null && userData.image.isNotEmpty) {
          print('NetImage');
          imageProvider = NetImage(
            userData?.image,
            height: 100.0,
            width: 100.0,
          );
        } else {
          imageProvider = Image.asset(
            PathUtil.logoIcon,
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          );
        }
        return Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                  ),
                  child: Hero(
                    tag: 'profile',
                    child: Material(
                      elevation: 8.0,
                      shape: const CircleBorder(),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: imageProvider,
                          ),
                          Positioned(
                            top: 0.0,
                            bottom: 0.0,
                            right: 0.0,
                            left: 0.0,
                            child: CircleAvatar(
                              backgroundColor: Colors.black26,
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.camera,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    final result = (await AppUtil.pickFiles(
                                      fileType: FileType.image,
                                    ))
                                        ?.first;
                                    if (result != null) {
                                      controller.uploadedImage(result);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: CircularBackButton(),
            ),
          ],
        );
      },
    );
  }
}
