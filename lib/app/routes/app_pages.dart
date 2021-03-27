import 'package:get/get.dart';

import 'package:careve/app/modules/auth/views/auth_view.dart';
import 'package:careve/app/modules/auth/views/phone_entry_view.dart';
import 'package:careve/app/modules/auth/views/reset_password_view.dart';
import 'package:careve/app/modules/auth/views/verification_code_view.dart';
import 'package:careve/app/modules/doctor_appointment/bindings/doctor_appoinment_binding.dart';
import 'package:careve/app/modules/doctor_appointment/views/doctor_appoinment_view.dart';
import 'package:careve/app/modules/doctors/bindings/doctors_binding.dart';
import 'package:careve/app/modules/doctors/views/doctors_view.dart';
import 'package:careve/app/modules/first_time/bindings/first_time_binding.dart';
import 'package:careve/app/modules/first_time/views/first_time_view.dart';
import 'package:careve/app/modules/home/views/home_view.dart';
import 'package:careve/app/modules/main_bottom_navigation.dart';
import 'package:careve/app/modules/single_doctor/bindings/single_doctor_binding.dart';
import 'package:careve/app/modules/single_doctor/views/single_doctor_view.dart';
import 'package:careve/app/modules/welcome_screen/bindings/welcome_screen_binding.dart';
import 'package:careve/app/modules/welcome_screen/views/welcome_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.WELCOME_SCREEN,
      page: () => WelcomeScreenView(),
      binding: WelcomeScreenBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
    ),
    GetPage(
      name: _Paths.PHONE_ENTRY,
      page: () => PhoneEntryView(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
    ),
    GetPage(
      name: _Paths.VERIFICATION_CODE,
      page: () => VerificationCodeView(),
    ),
    GetPage(
      name: _Paths.FIRST_TIME,
      page: () => FirstTimeView(),
      binding: FirstTimeBinding(),
    ),
    GetPage(
      name: _Paths.DOCTORS,
      page: () => DoctorsView(),
      binding: DoctorsBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
    ),
    GetPage(
      name: _Paths.SINGLE_DOCTOR,
      page: () => SingleDoctorView(),
      binding: SingleDoctorBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_APPOINMENT,
      page: () => DoctorAppointmentView(),
      binding: DoctorAppointmentBinding(),
    ),
  ];
}
