import 'dart:io';

import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SelfOrOtherEnum {
  self,
  other,
}

class MessageViewer extends StatelessWidget {
  final int id;
  final SelfOrOtherEnum type;
  final String content;
  final String sender;
  final List<File> files;
  final String date;

  const MessageViewer({
    @required this.id,
    @required this.content,
    @required this.type,
    @required this.sender,
    @required this.date,
    this.files,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                textDirection: AppUtil.isLtr
                    ? (type == SelfOrOtherEnum.self
                        ? TextDirection.ltr
                        : TextDirection.rtl)
                    : (type == SelfOrOtherEnum.self
                        ? TextDirection.rtl
                        : TextDirection.ltr),
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: type == SelfOrOtherEnum.self
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        if (sender != null)
                          Text(
                            sender,
                            style: TextStyle(
                              color: ColorUtil.primaryColor,
                              fontSize: 36.sp,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        if (content != null) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 5.0,
                            ),
                            margin: EdgeInsets.only(
                              top: 5.0,
                              bottom: 5.0,
                              left: type == SelfOrOtherEnum.self ? 30.0 : 5.0,
                              right: type == SelfOrOtherEnum.self ? 5.0 : 30.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: messageBorderRadius(),
                              color: type == SelfOrOtherEnum.self
                                  ? ColorUtil.primaryColor
                                  : ColorUtil.lightGrey,
                            ),
                            child: Text(
                              content ?? '',
                              style: TextStyle(
                                color: type == SelfOrOtherEnum.self
                                    ? Colors.white
                                    : ColorUtil.primaryColor,
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 2.5,
                              horizontal: 10.0,
                            ),
                            child: Text(
                              date ?? '',
                              style: const TextStyle(
                                color: ColorUtil.mediumGrey,
                                fontSize: 11.0,
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  BorderRadius messageBorderRadius() {
    return BorderRadius.only(
      topLeft: const Radius.circular(
        10.0,
      ),
      bottomLeft: Radius.circular(
        type == SelfOrOtherEnum.self ? 10.0 : 0.0,
      ),
      topRight: const Radius.circular(
        10.0,
      ),
      bottomRight: Radius.circular(type == SelfOrOtherEnum.self ? 0.0 : 10.0),
    );
  }
}
