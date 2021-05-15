import 'package:careve/app/components/animated_list_handler.dart';
import 'package:careve/app/components/app_button.dart';
import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/components/app_drop_down_menu.dart';
import 'package:careve/app/components/app_text_field.dart';
import 'package:careve/app/components/loading.dart';
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
                        validator: const QuickTextValidator().call,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      AppTextField(
                        controller.title,
                        hintText: S.of(context).title,
                        readOnly: controller.isBusy.value,
                        validator: const QuickTextValidator().call,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      AppTextField(
                        controller.article,
                        hintText: S.of(context).article,
                        readOnly: controller.isBusy.value,
                        maxLines: 8,
                        validator: const QuickTextValidator().call,
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
                          validator: const QuickTextValidator().call,
                        ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      if (controller.articleType.value != S.of(context).qa)
                        AwarenessImageHandler(),
                      if (controller.isBusy.value)
                        Loading()
                      else
                        CareveButton(
                          title: S.of(context).done,
                          margin: const EdgeInsets.symmetric(vertical: 20.0),
                          onTap: controller.addAwareness,
                        ),
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
