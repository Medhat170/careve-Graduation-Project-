import 'dart:convert';
import 'dart:io';
import 'package:careve/app/mixins/api_mixin.dart';
import 'package:careve/app/mixins/busy_mixin.dart';
import 'package:careve/app/models/clinic_model.dart';
import 'package:careve/app/models/doctor_clinics_appointments.dart'
    as clinicWeb;
import 'package:careve/app/models/user.dart';
import 'package:careve/app/routes/app_pages.dart';
import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/path_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:careve/app/components/extensions.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AuthService extends GetxService with ApiMixin, BusyMixin {
  final CacheService cacheService;

  AuthService(this.cacheService);

  final signUP = false.obs;
  final isDoc = false.obs;
  final currentStep = 0.obs;
  final clinicLoading = false.obs;
  final complete = false.obs;
  final hidePassword = true.obs;
  final pinCodeError = RxString();
  final user = Rx<User>();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> personalDataFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> clinicFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> docVerificationFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordsFormKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nationalId = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cost = TextEditingController();
  TextEditingController confirmedPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  final dataResponse = RxMap<String, dynamic>();

  final cv = Rx<File>();
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

  final userClinics = Rx<UserClinics>(
    UserClinics(
      clinics: [
        Clinic(
          address: Address(
            title: 'Default clinic',
          ),
          days: [],
        ),
      ],
    ),
  );

  void changeObscuring() {
    hidePassword(!hidePassword.value);
  }

  void addNewClinic() {
    userClinics.update((val) {
      val.clinics.add(
        Clinic(
          address: Address(
            title: 'clinic',
          ),
          days: []
              .map(
                (e) => Day(
                  day: e.toString(),
                ),
              )
              .toList(),
        ),
      );
    });
  }

  String changeAddress(
    int index, {
    String formattedAddress,
    String title,
    double lat,
    double long,
  }) {
    if (title != null) {
      userClinics.value.clinics[index].address.title = title;
    }
    if (lat != null) {
      userClinics.value.clinics[index].address.lat = lat;
    }
    if (long != null) {
      userClinics.value.clinics[index].address.long = long;
    }
    if (formattedAddress != null) {
      userClinics.value.clinics[index].address.formattedAddress =
          formattedAddress;
    }
    userClinics.update((val) {
      val.clinics[index].address = userClinics.value.clinics[index].address;
    });
    return formattedAddress;
  }

  String changePhone(int index, String newPhone) {
    // String value = newPhone.split('').reversed.join();
    // userClinics.update((val) {
    //   val.clinics[index].phone = value;
    // });
    userClinics.value.clinics[index].phone = newPhone;
    return newPhone;
  }

  void removeDay(int clinicIndex, int dayIndex) {
    userClinics.update((val) {
      val.clinics[clinicIndex].days.removeAt(dayIndex);
    });
  }

  void removeClinic(int clinicIndex) {
    userClinics.update((val) {
      val.clinics.removeAt(clinicIndex);
    });
  }

  void changeDay(
    int clinicIndex, {
    DateTime startTime,
    DateTime endTime,
    String day,
  }) {
    final int dayIndex = userClinics.value.clinics[clinicIndex].days.indexWhere(
      (element) => element.day == day,
    );
    try {
      if (dayIndex != null && dayIndex != -1) {
        final Day targetDay =
            userClinics.value.clinics[clinicIndex].days[dayIndex];
        if (startTime != null) {
          targetDay.startTime = startTime.toTimeOnly();
          print(targetDay.startTime);
        } else if (endTime != null) {
          final now = DateTime.now();
          final int startHour =
              int.tryParse(targetDay?.startTime?.split(':')[0]);
          final int startMin =
              int.tryParse(targetDay?.startTime?.split(':')[1]) ?? 0;
          if (endTime.isAfter(
            DateTime(
              now.year,
              now.month,
              now.day,
              startHour,
              startMin,
            ),
          )) {
            targetDay.endTime = endTime.toTimeOnly();
          } else {
            throw S.current.timeIsBefore;
          }
        }
        targetDay.status = 1;
        userClinics.update((val) {
          val.clinics[clinicIndex].days[dayIndex] = targetDay;
        });
      } else {
        userClinics.update((val) {
          val.clinics[clinicIndex].days.add(
            Day(
              day: day,
              startTime: startTime.toTimeOnly(),
              endTime: endTime.toTimeOnly(),
              status: 1,
            ),
          );
        });
      }
    } catch (e) {
      AppUtil.showAlertDialog(body: e.toString());
    }
  }

  static AuthService get to => Get.find();

  bool get isAuth => userId != null;

  String get userId => cacheService?.settingsRepo?.cachedUserId;
  final currentLocation = Rx<Position>();

  Future onStepContinue() async {
    try {
      if (currentStep.value == 0) {
        final formData = personalDataFormKey.currentState;
        if (uploadedImage.value != null) {
          if (formData.validate()) {
            formData.save();
            goTo(currentStep.value + 1);
          }
        } else {
          throw S.current.imageValidation;
        }
      } else if (currentStep.value == 1) {
        final formData = docVerificationFormKey.currentState;
        if (formData.validate()) {
          formData.save();
          if (cv.value != null) {
            if (currentLocation.value == null) {
              startBusy();
              currentLocation(await AppUtil.getCurrentLocation());
              endBusySuccess();
            }
            goTo(currentStep.value + 1);
          } else {
            throw S.current.cvValidation;
          }
        }
      } else if (currentStep.value == 2) {
        final formData = clinicFormKey.currentState;
        if (formData.validate()) {
          formData.save();
          if (userClinics.value.clinics.any(
              (element) => element?.days == null || element.days.isEmpty)) {
            throw S.current.daysEmpty;
          } else {
            complete.value = true;
            await auth();
          }
        }
      } else {
        throw 'Invalid Stepper input';
      }
      stepStates[currentStep.value] = StepState.editing;
      stepStates[currentStep.value - 1] = StepState.complete;
      stepActivation[currentStep.value] = true;
      stepActivation[currentStep.value - 1] = false;
    } catch (e) {
      print(
        '----------- Invalid Stepper Exception (${e.toString()}) -----------',
      );
      await AppUtil.showAlertDialog(body: e.toString());
    }
  }

  void onStepCancel() {
    if (currentStep.value > 0) {
      if (!dataResponse.isBlank || dataResponse.isNotEmpty) {
        signUP(false);
        isDoc(true);
        password.clear();
        Get.back();
      } else {
        goTo(currentStep.value - 1);
      }
    }
    stepStates[currentStep.value] = StepState.editing;
    stepStates[currentStep.value + 1] = StepState.disabled;
    stepActivation[currentStep.value] = true;
    stepActivation[currentStep.value + 1] = false;
  }

  final stepStates = RxList<StepState>([
    StepState.editing,
    StepState.disabled,
    StepState.disabled,
  ]);
  final stepActivation = RxList<bool>([
    true,
    false,
    false,
  ]);

  void goTo(int step) {
    currentStep(step);
  }

  String actualDay(String day) {
    final List<String> ref = [
      'SAT',
      'SUN',
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
    ];

    final List<String> intlDays = [
      S.current.sat,
      S.current.sun,
      S.current.mon,
      S.current.tue,
      S.current.wed,
      S.current.thu,
      S.current.fri,
    ];
    final int index = ref.indexWhere((element) => element == day.toUpperCase());
    if (index != null && index != -1) {
      return intlDays[index];
    } else {
      return day;
    }
  }

  Future<bool> tryAutoLogin() async {
    final cachedUserId = cacheService?.settingsRepo?.cachedUserId;
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
    isDoc(user.value.nationalId != null);
    return true;
  }

  Future<void> auth() async {
    try {
      startBusy();
      Map<String, dynamic> response;
      if (signUP.value == false) {
        final formData = authFormKey.currentState;
        if (formData.validate()) {
          formData.save();
          response = await post(
            ApiPath.login,
            body: {
              'email': email.text,
              'password': password.text,
              'type': 'mobile',
            },
          );
        }
      } else if (signUP.value && isDoc.value == false) {
        response = await patientAuth();
      } else if (signUP.value && isDoc.value == true) {
        response = await docAuth();
      }
      if (response != null) {
        user(await CacheService.to.userRepo.updateUserCache(response));
        CacheService.to.settingsRepo.setCachedUserId(user.value.id);
        name.clear();
        password.clear();
        confirmedPassword.clear();
        isDoc(user.value.nationalId != null);
        Get.offAllNamed(Routes.HOME);
      }
    } catch (error) {
      printError(info: error.toString());
      if (error.toString() == S.current.clinicsProblem) {
        await AppUtil.showAlertDialog(
          body: error.toString(),
          enableCancel: true,
          onConfirm: () {
            signUP(false);
            isDoc(true);
            password.clear();
            Get.back();
          },
        );
      } else {
        await AppUtil.showAlertDialog(body: error.toString());
      }
    }
    endBusySuccess();
  }

  Future<Map<String, dynamic>> patientAuth() async {
    Map<String, dynamic> response;
    final formData = authFormKey.currentState;
    if (formData.validate()) {
      formData.save();
      print('Name : ${name?.text}');
      print('Email : ${email?.text}');
      print('Password : ${password?.text}');
      print('Confirmed password : ${confirmedPassword?.text}');
      try {
        response = await post(
          ApiPath.patientSignUp,
          body: {
            'name': name.text,
            'email': email.text,
            'password': password.text,
            'type': 'mobile',
          },
        );
        name.clear();
        email.clear();
        password.clear();
        confirmedPassword.clear();
      } catch (error) {
        rethrow;
      }
    }
    return response;
  }

  Future<Map<String, dynamic>> docAuth() async {
    print("User Clinics : ${json.encode({
      'clinics': userClinics.value.clinics
    })}");
    try {
      if (dataResponse.isBlank && dataResponse.isEmpty) {
        dataResponse(
          await post(
            ApiPath.docSignUpWithOutClinics,
            body: {
              'name': name.text,
              'email': email.text,
              'password': password.text,
              'adress': '',
              'mobile': '',
              'cost': cost.text,
              'nationalid': nationalId.text,
              'type': 'mobile'
            },
            files: {
              'cv': cv.value,
              'image': uploadedImage.value,
            },
          ),
        );
      }
      print('Doc id : ${dataResponse['id']}');
      await validateClinics();
      print(json.encode({'clinics': userClinics?.value?.clinics}));
      final Map<String, dynamic> clinicDataResponse = await post(
        ApiPath.addClinic,
        body: {
          'docid': dataResponse['id'],
          'clinics': json.encode({'clinics': userClinics?.value?.clinics})
        },
      );
      name.clear();
      email.clear();
      password.clear();
      confirmedPassword.clear();
      nationalId.clear();
      cv.nil();
      userClinics.nil();
      userClinics(
        UserClinics(
          clinics: [
            Clinic(
              address: Address(
                title: 'Default clinic',
              ),
              days: [],
            ),
          ],
        ),
      );
    } catch (error) {
      printError(info: error.toString());
      throw S.current.clinicsProblem;
    }
    return dataResponse;
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
    Map<String, dynamic> response;
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
        if (isDoc.value) {
          response = await post(
            ApiPath.editDoctorProfile,
            body: {
              'apitoken': user.value.accessToken,
              'name': name.text,
              'email': email.text,
              'cost': cost.text,
              'type': 'mobile'
            },
            files: {
              'image': uploadedImage.value,
            },
          );
        } else {
          response = await post(
            ApiPath.editPatientProfile,
            body: {
              'apitoken': user.value.accessToken,
              'name': name.text,
              'email': email.text,
              'bloodtype': bloodType.value,
              'type': 'mobile',
            },
            files: {
              'image': uploadedImage.value,
            },
          );
        }
        if (response != null) {
          user(await CacheService.to.userRepo.updateUserCache(response));
          CacheService.to.settingsRepo.setCachedUserId(user.value.id);
          Get.back();
        }
      } catch (error) {
        await AppUtil.showAlertDialog(body: error.toString());
      }
      endBusySuccess();
    }
  }

  Future<void> validateClinics() async {
    try {
      for (final Clinic clinic in userClinics.value.clinics) {
        for (final Day day in clinic.days) {
          if (day.endTime == null) {
            final dayRef = actualDay(day.day);
            throw S.current.endTimeNull(dayRef);
          }
        }
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await CacheService.to.userRepo.clear();
      user.value = null;
      Get.offAllNamed(Routes.WELCOME_SCREEN);
    } catch (e) {
      printError(info: e.toString());
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
    nationalId.dispose();
    cost.dispose();
    image.nil();
    nationalId.clear();
    cv.nil();
    uploadedImage.nil();
    userClinics.nil();
    super.onClose();
  }
}
