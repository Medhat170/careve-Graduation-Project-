import 'package:careve/app/components/animatedListHandler.dart';
import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/components/appDropDownMenu.dart';
import 'package:careve/app/components/appTextField.dart';
import 'package:careve/app/modules/awareness/components/awareness_image_handler.dart';
import 'package:careve/app/utilities/validators.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/awareness_controller.dart';

class AddAwarenessView extends GetView<AwarenessController> {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Obx(
        () => Column(
          children: [
            controller.customAppBar(
              S.of(context).addAwareness,
              enableBack: true,
            ),
            Expanded(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  child: AnimatedListHandler(
                    children: [
                      AppDropDownMenu(
                        listElements: [
                          S.of(context).article,
                          S.of(context).qa,
                          S.of(context).video,
                        ],
                        onChanged: (String value) {
                          controller.articleType(value);
                        },
                        hintText: controller.articleType?.value == null
                            ? S.of(context).awarenessType
                            : controller.articleType?.value ?? '-',
                        validator: QuickTextValidator().call,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      AppTextField(
                        controller.title,
                        hintText: S.of(context).title,
                        readOnly: controller.isBusy.value,
                        keyBoardType: TextInputType.text,
                        validator: QuickTextValidator().call,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      AppTextField(
                        controller.article,
                        hintText: S.of(context).article,
                        readOnly: controller.isBusy.value,
                        maxLines: 8,
                        keyBoardType: TextInputType.text,
                        validator: QuickTextValidator().call,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (controller.articleType.value == S.of(context).video)
                        AppTextField(
                          controller.link,
                          hintText: S.of(context).youTubeLink,
                          readOnly: controller.isBusy.value,
                          keyBoardType: TextInputType.url,
                          validator: QuickTextValidator().call,
                        ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      AwarenessImageHandler(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
