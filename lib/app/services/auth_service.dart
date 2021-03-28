import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/app_service.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/services/cache/user_repo.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxService with ApiMixin, BusyMixin {
  final signUP = false.obs;
  final isDoc = false.obs;
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordsFormKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmedPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  final hidePassword = true.obs;
  final pinCodeError = RxString();
  final dio = Dio();

  static AuthService get to => Get.find();

  Future<void> auth() async {
    final formData = authFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      print('Name : ${name?.text}');
      print('Email : ${email?.text}');
      print('Password : ${password?.text}');
      print('Confirmed password : ${confirmedPassword?.text}');
      try {
        startBusy();
        var response;
        if (signUP.value == false) {
          response = await post(
            url: ApiPath.login,
            body: {
              'email': email.text,
              'password': password.text,
            },
          );
        } else if (signUP.value && isDoc.value == false) {
          response = await post(
            url: ApiPath.patientSignUp,
            body: {
              'name': name.text,
              'email': email.text,
              'password': password.text,
            },
          );
        }
        AppService.to.user(UserRepo.updateUserCache(response));
        CacheService.to.settingsRepo
            .setCachedUserId(AppService.to.user.value.id);
        name.clear();
        password.clear();
        confirmedPassword.clear();
        email.clear();
        Get.offAllNamed(Routes.MAIN);
      } catch (error) {
        await AppUtil.showAlertDialog(body: error.toString());
      }
      endBusySuccess();
    }
  }

  Future<void> sendPhoneNumber() async {
    final formData = phoneFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      print('Phone : ${phone?.text}');
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
      print('Code : ${code?.text}');
      try {
        startBusy();
        //TODO Send api
        endBusySuccess();
        phone.clear();
        code.clear();
        Get.offAllNamed(Routes.RESET_PASSWORD);
      } catch (error) {
        pinCodeError('Api Error');
        await AppUtil.showAlertDialog(body: error.toString());
      }
    } else {
      pinCodeError(S.current.sixDigitsIsAMust);
    }
  }

  Future<void> restPassword() async {
    if (password.text == confirmedPassword.text) {
      final formData = passwordsFormKey.currentState;
      print('Password : ${password?.text}');
      print('Confirmed password : ${confirmedPassword?.text}');
      if (formData.validate()) {
        formData.save();
        try {
          startBusy();
          //TODO Send api
          endBusySuccess();
          password.clear();
          confirmedPassword.clear();
          Get.offAllNamed(Routes.AUTH);
        } catch (error) {
          await AppUtil.showAlertDialog(body: error.toString());
        }
      }
    } else {
      await AppUtil.showAlertDialog(body: S.current.passwordsDoNotMatch);
    }
  }

  @override
  void onClose() {
    name.dispose();
    password.dispose();
    confirmedPassword.dispose();
    code.dispose();
    email.dispose();
    super.onClose();
  }
}
