import 'package:careve/app/components/global_scaffold.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/settings/components/setting_item.dart';
import 'package:careve/app/modules/settings/controllers/settings_controller.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class SettingsView extends GetView<SettingsController> with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBar(
            S.of(context).settings,
            enableBack: true,
          ),
          SettingItem(
            title: S.of(context).language,
            onPressed: () async {
              await Get.bottomSheet(
                Container(
                  height: Get.height * 0.30,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Text(
                        S.of(context).selectLanguageTitle,
                        style: TextStyle(
                          color: ColorUtil.blackColor,
                          fontSize: 66.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      InkWell(
                        onTap: () => controller.changeLang('en'),
                        child: Text(
                          'English',
                          style: TextStyle(
                            color: ColorUtil.mediumGrey,
                            fontSize: 54.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      InkWell(
                        onTap: () => controller.changeLang('ar'),
                        child: Text(
                          '??????????????',
                          style: TextStyle(
                            color: ColorUtil.mediumGrey,
                            fontSize: 54.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            trailing: SizedBox(
              width: 30.0,
              height: 30.0,
              child: ClipPolygon(
                sides: 6,
                borderRadius: 5.0,
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    !AppUtil.isLtr ? PathUtil.arImage : PathUtil.enImage,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          SettingItem(
            title: S.of(context).clearCache,
            // onPressed: () async => await controller.clearCache(),
          ),
        ],
      ),
    );
  }
}
