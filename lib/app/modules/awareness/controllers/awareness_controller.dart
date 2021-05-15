import 'dart:io';

import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/app_bar_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/blog.dart';
import 'package:careve/app/services/auth_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AwarenessController extends GetxController
    with CustomAppBar, SingleGetTickerProviderMixin, BusyMixin, ApiMixin {
  GlobalKey<FormState> newArticleFormKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController article = TextEditingController();
  TextEditingController link = TextEditingController();
  final articleType = RxString();
  final image = Rx<File>();
  final blog = Rx<Blog>();
  final currentIndex = 0.obs;

  TabController tabController;

  List<Article> get articles =>
      blog.value.data
          .where((element) => element.links == null && element.image != null)
          .toList() ??
      <Article>[];

  List<Article> get videos =>
      blog.value.data.where((element) => element.links != null).toList() ??
      <Article>[];

  List<Article> get qA =>
      blog.value.data
          .where((element) => element.links == null && element.image == null)
          .toList() ??
      <Article>[];

  Future<void> fetchAllAwareness() async {
    try {
      startBusy();
      final Map<String, dynamic> response = await get(
        ApiPath.getAllAwareness,
      );
      blog(Blog.fromJson(response));
      tabController = TabController(
        length: 3,
        vsync: this,
      );
      endBusySuccess();
    } catch (error) {
      endBusyError(
        error.toString(),
        showDialog: error.toString() != S.current.socketException,
      );
    }
  }

  Future<void> addAwareness() async {
    try {
      startBusy();
      final userData = AuthService.to.user?.value;
      final Map<String, dynamic> response = await post(
        ApiPath.addAwareness,
        body: {
          'title': title?.text,
          'body': article?.text,
          'type': 'mobile',
          'videolink': link?.text,
          'apitoken': userData?.accessToken,
          'id': userData?.id,
        },
        files: image?.value == null
            ? {}
            : {
                'image': image?.value,
              },
      );
      if (response != null) {
        blog.update((val) {
          val.data.add(Article.fromJson(response));
        });
        title.clear();
        article.clear();
        link.clear();
        image.nil();
        Get.back();
      }
    } catch (error) {
      AppUtil.showAlertDialog(body: error.toString());
    }
    endBusySuccess();
  }

  @override
  void onReady() {
    fetchAllAwareness();
    super.onReady();
  }

  void onChangeTab(int value) {
    currentIndex(value);
  }
}
