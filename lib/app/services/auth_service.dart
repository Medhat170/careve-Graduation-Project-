import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxService with ApiMixin, BusyMixin {
  final signUP = false.obs;
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  final hidePassword = true.obs;
  final pinCodeError = RxString();

  static AuthService get to => Get.find();

  Future<void> auth() async {
    final formData = authFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      try {
        startBusy();
        if (signUP == null) {
          // final resp = await request();
          endBusySuccess();
        } else {
          // final resp = await request();
          endBusySuccess();
        }
        Get.offAllNamed(Routes.HOME);
      } catch (error) {
        await AppUtil.showAlertDialog(body: error.toString());
      }
    }
  }

  Future<void> sendPhoneNumber() async {
    final formData = phoneFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      try {
        startBusy();
        //TODO Send api
        endBusySuccess();
        Get.toNamed(Routes.VERIFICATION_CODE);
      } catch (error) {
        await AppUtil.showAlertDialog(body: error.toString());
      }
    }
  }

  Future<void> verifyCode() async {
    if (code.text.length == 6) {
      try {
        startBusy();
        //TODO Send api
        endBusySuccess();
        Get.offAllNamed(Routes.HOME);
      } catch (error) {
        pinCodeError('Api Error');
        await AppUtil.showAlertDialog(body: error.toString());
      }
    } else {
      pinCodeError('Error must be 6 digits!');
    }
  }

  @override
  void onClose() {
    name.dispose();
    password.dispose();
    email.dispose();
    super.onClose();
  }
}
