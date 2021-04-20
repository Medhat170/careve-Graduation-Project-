import 'dart:io';

import 'package:careve/app/modules/chat/controllers/chat_controller.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FilesViewer extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.toUpload.isNotEmpty
          ? Container(
              height: 90,
              width: double.infinity,
              color: Colors.white.withOpacity(
                0.5,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...controller.toUpload.entries
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: e.value.path.contains('pdf')
                              ? Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          FontAwesomeIcons.filePdf,
                                          color: ColorUtil.primaryColor,
                                        ),
                                        Text(
                                          e.key,
                                          style: const TextStyle(
                                            color: ColorUtil.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      top: 0.0,
                                      right: 0.0,
                                      child: GestureDetector(
                                        onTap: () =>
                                            controller.toUpload.remove(e.key),
                                        child: Icon(
                                          Icons.cancel,
                                          color: ColorUtil.errorColor,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 10.0,
                                        right: 10.0,
                                      ),
                                      child: Image.file(File(e.value.path)),
                                    ),
                                    Positioned(
                                      top: 0.0,
                                      right: 0.0,
                                      child: GestureDetector(
                                        onTap: () =>
                                            controller.toUpload.remove(e.key),
                                        child: Icon(
                                          Icons.cancel,
                                          color: ColorUtil.errorColor,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      )
                      .toList(),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
