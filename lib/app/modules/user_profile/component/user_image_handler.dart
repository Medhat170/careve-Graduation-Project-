import 'package:careve/app/components/backButton.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
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
          PathUtil.userImage,
          height: 50.0,
          fit: BoxFit.cover,
        );
        if (controller.uploadedImage?.value != null) {
          imageProvider = Image.file(
            controller.uploadedImage.value,
            height: 50.0,
            fit: BoxFit.cover,
          );
        } else if (userData?.image != null && userData.image.length > 0) {
          imageProvider = Image.network(
            userData?.image,
            height: 50.0,
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
                      shape: CircleBorder(),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: imageProvider,
                            radius: 50.0,
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
                                  icon: Icon(
                                    FontAwesomeIcons.camera,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    final result = (await AppUtil.pickFiles(
                                      allowMultiple: false,
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
