import 'package:careve/app/components/appDirectionality.dart';
import 'package:careve/app/modules/home/views/home_view.dart';
import 'package:careve/app/services/app_service.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class MainView extends GetView<AppService> {
  final List<Widget> _body = [
    HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return AppDirectionality(
      child: SafeArea(
        child: Scaffold(
          body: Obx(() => _body[controller.currentIndex.value]),
          bottomNavigationBar: TitledBottomNavigationBar(
            height: 60,
            indicatorHeight: 2,
            onTap: (int index) {
              print(index);
              controller.currentIndex(index);
            },
            reverse: true,
            currentIndex: controller.currentIndex.value,
            curve: Curves.easeInBack,
            items: [
              TitledNavigationBarItem(
                title: Text(
                  S.of(context).home,
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                  ),
                ),
                icon: Icon(
                  FontAwesomeIcons.home,
                ),
              ),
              TitledNavigationBarItem(
                title: Text(
                  S.of(context).explore,
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                  ),
                ),
                icon: Icon(
                  FontAwesomeIcons.pen,
                ),
              ),
              TitledNavigationBarItem(
                title: Text(
                  S.of(context).notifications,
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                  ),
                ),
                icon: Icon(
                  FontAwesomeIcons.solidBell,
                ),
              ),
              TitledNavigationBarItem(
                title: Text(
                  S.of(context).profile,
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                  ),
                ),
                icon: Icon(
                  FontAwesomeIcons.solidUser,
                ),
              ),
            ],
            activeColor: ColorUtil.primaryColor,
            inactiveColor: ColorUtil.mediumGrey,
          ),
        ),
      ),
    );
  }
}
