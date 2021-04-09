import 'dart:ui';

import 'package:careve/app/modules/chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PdfHandler extends GetView<ChatController> {
  final String url;
  final String fileName;

  PdfHandler(
    this.url,
    this.fileName,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.w,
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 8.0,
            ),
            child: InkWell(
              onTap: () {
                // if (url != null) controller.downloadFile(url, fileName);
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 250.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.filePdf,
                          color: Colors.white,
                          size: 100,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                fileName,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
