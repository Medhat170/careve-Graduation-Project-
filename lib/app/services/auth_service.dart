import 'dart:io';

import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/user.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxService with ApiMixin, BusyMixin {
  final CacheService cacheService;

  AuthService(this.cacheService);

  final signUP = false.obs;
  final isDoc = false.obs;
  final user = Rx<User>();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordsFormKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmedPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  final image = RxString();
  final uploadedImage = Rx<File>();
  final dateOfBirth = Rx<DateTime>();
  final bloodType = RxString();
  final bloodTypesRef = RxList<String>([
    'A-',
    'A+',
    'B-',
    'B+',
    'AB-',
    'AB+',
    'O-',
    'O+',
  ]);
  final hidePassword = true.obs;
  final pinCodeError = RxString();

  static AuthService get to => Get.find();

  bool get isAuth => userId != null;

  String get userId => cacheService?.settingsRepo?.cachedUserId;

  Future<bool> tryAutoLogin() async {
    var cachedUserId = cacheService?.settingsRepo?.cachedUserId;
    if (cachedUserId == null) {
      print('User is not auth!');
      return false;
    }
    final cachedUser = cacheService.userRepo.getValueById(cachedUserId);
    if (cachedUser == null) {
      print('User is not auth!');
      return false;
    }
    print('User is auth!');
    user.value = cachedUser;
    return true;
  }

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
              'type': 'mobile',
            },
          );
        } else if (signUP.value && isDoc.value == false) {
          response = await post(
            url: ApiPath.patientSignUp,
            body: {
              'name': name.text,
              'email': email.text,
              'password': password.text,
              'type': 'mobile',
            },
          );
        }
        user(await CacheService.to.userRepo.updateUserCache(response));
        CacheService.to.settingsRepo.setCachedUserId(user.value.id);
        name.clear();
        password.clear();
        confirmedPassword.clear();
        email.clear();
        Get.offAllNamed(Routes.HOME);
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

  Future<void> editProfile() async {
    final formData = editFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      print('Phone : ${phone?.text}');
      print('Name : ${name?.text}');
      print('Email : ${email?.text}');
      print('DateOfBirth : ${dateOfBirth?.value?.toShortUserString()}');
      print('BloodType : ${bloodType?.value}');
      print('Address : ${address?.text}');
      print('Password : ${password?.text}');
      print('Confirmed password : ${confirmedPassword?.text}');
      try {
        startBusy();
        //TODO Send api
        endBusySuccess();
        Get.back();
      } catch (error) {
        await AppUtil.showAlertDialog(body: error.toString());
      }
    }
  }

  @override
  void onClose() {
    name.dispose();
    password.dispose();
    confirmedPassword.dispose();
    code.dispose();
    email.dispose();
    address.dispose();
    dateOfBirth.nil();
    bloodType.nil();
    image.nil();
    super.onClose();
  }
}
