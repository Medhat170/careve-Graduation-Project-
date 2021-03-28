import 'package:careve/app/services/cache/cache_service.dart';
import 'package:careve/app/services/initialBinding.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/pathUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CacheService.registerTypeAdapters();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    precacheImage(
      AssetImage(
        PathUtil.welcomeImage,
      ),
      context,
    );
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      builder: () => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: GetMaterialApp(
          title: 'Careve',
          debugShowCheckedModeBanner: false,
          theme: AppUtil.appTheme,
          getPages: AppPages.routes,
          initialRoute: Routes.SPLASH,
          initialBinding: InitialBinding(),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
      ),
    );
  }
}
