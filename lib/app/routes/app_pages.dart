import 'package:get/get.dart';

import 'package:careve/app/modules/home/bindings/home_binding.dart';
import 'package:careve/app/modules/home/views/home_view.dart';
import 'package:careve/app/modules/sign_in/bindings/sign_in_binding.dart';
import 'package:careve/app/modules/sign_in/views/sign_in_view.dart';
import 'package:careve/app/modules/splash/bindings/splash_binding.dart';
import 'package:careve/app/modules/splash/views/splash_view.dart';
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
      name: _Paths.SIGN_IN,
      page: () => SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
  ];
}
