import 'package:careve/app/modules/auth/views/reset_password_view.dart';
import 'package:get/get.dart';

import 'package:careve/app/modules/auth/views/auth_view.dart';
import 'package:careve/app/modules/auth/views/phone_entry_view.dart';
import 'package:careve/app/modules/auth/views/verification_code_view.dart';
import 'package:careve/app/modules/first_time/bindings/first_time_binding.dart';
import 'package:careve/app/modules/first_time/views/first_time_view.dart';
import 'package:careve/app/modules/home/bindings/home_binding.dart';
import 'package:careve/app/modules/home/views/home_view.dart';
import 'package:careve/app/modules/welcome_screen/bindings/welcome_screen_binding.dart';
import 'package:careve/app/modules/welcome_screen/views/welcome_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
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
  ];
}
