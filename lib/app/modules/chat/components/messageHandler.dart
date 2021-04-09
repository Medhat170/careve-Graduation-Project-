import 'package:careve/app/components/appTextField.dart';
import 'package:careve/app/modules/chat/controllers/chat_controller.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MessageHandler extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: double.infinity,
          color: Colors.transparent,
          child: Row(
            textDirection: TextDirection.ltr,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  await controller.uploadFiles();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: ColorUtil.primaryColor,
                    size: 20.0,
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => AppTextField(
                    controller.messageController,
                    readOnly: controller.isBusy.value,
                    hintText: S.of(context).typeMessage,
                    autoFocus: false,
                  ),
                ),
              ),
              Obx(
                () => GestureDetector(
                  onTap: !controller.isBusy.value
                      ? () async {
                          await controller.onSend();
                        }
                      : null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      FontAwesomeIcons.paperPlane,
                      color: ColorUtil.primaryColor,
                      size: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
