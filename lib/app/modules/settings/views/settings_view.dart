import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/modules/settings/components/settingItem.dart';
import 'package:careve/app/modules/settings/controllers/settings_controller.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class SettingsView extends GetView<SettingsController> with CustomAppBar {
  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      body: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      height: 200,
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                          topLeft: const Radius.circular(10.0),
                          topRight: const Radius.circular(10.0),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Column(
                        children: [
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
                            height: 20.0,
                          ),
                          InkWell(
                            onTap: () => controller.changeLang('ar'),
                            child: Text(
                              'العربيه',
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
                      child: Image.asset(
                        !AppUtil.isLtr ? PathUtil.arImage : PathUtil.enImage,
                        fit: BoxFit.fill,
                      ),
                      color: Colors.white,
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
        ),
      ),
    );
  }
}
