import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController with ApiMixin, BusyMixin {
  final bool signUP;

  AuthController(this.signUP) : assert(signUP != null);
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  final hidePassword = true.obs;

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

  @override
  void onClose() {
    name.dispose();
    password.dispose();
    email.dispose();
    super.onClose();
  }
}
