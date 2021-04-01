import 'package:careve/app/components/AnimatedListHandler.dart';
import 'package:careve/app/modules/articles/components/ArticlesView.dart';
import 'package:careve/app/modules/articles/controllers/articles_controller.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBar extends GetView<ArticlesController> {
  @override
  Widget build(BuildContext context) {
    return AnimatedListHandler(
      noScroll: true,
      shrinkWrap: true,
      children: [
        TabBar(
          controller: controller.tabController,
          isScrollable: true,
          indicatorColor: ColorUtil.primaryColor,
          tabs: [
            ...List.generate(
              2,
              (index) => Tab(
                child: Text(
                  'Sat',
                  style: TextStyle(
                    color: ColorUtil.primaryColor,
                    fontSize: 44.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        // TabBarView(
        //   controller: controller.tabController,
        //   children: <Widget>[... ],
        //   //controller: _tabController,
        // ),
        ...List.generate(
          1,
          (index) => ArticlesView(),
        ),
      ],
    );
  }
}
