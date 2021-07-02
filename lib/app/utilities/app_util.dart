import 'dart:io';

import 'package:careve/app/models/clinic_model.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart' as intl;
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

class AppUtil {
  static final RegExp emailValidatorRegExp =
      RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  static final RegExp phoneValidatorRegExp = RegExp(r'^\+?[0-9]{10,}$');
  static BorderRadius borderRadius = BorderRadius.circular(10.0);
  static BorderRadius borderRadius25 = BorderRadius.circular(25.0);
  static UnderlineInputBorder transparentUnderLineInputBorder =
      const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0.5,
    ),
  );

  static OutlineInputBorder transparentUOutLineInputBorder = OutlineInputBorder(
    borderRadius: borderRadius,
    borderSide: const BorderSide(
      color: Colors.transparent,
      width: 0.5,
    ),
  );
  static OutlineInputBorder lightGreyOutLineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: ColorUtil.lightGrey,
      width: 0.5,
    ),
    borderRadius: AppUtil.borderRadius,
  );
  static ThemeData appTheme = ThemeData(
    fontFamily: 'Cairo',
    primaryColor: ColorUtil.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static bool get isLtr => intl.Intl.getCurrentLocale() == 'en';

  static Locale get currentLocale =>
      AppUtil.isLtr ? const Locale('en', 'US') : const Locale('ar', 'EG');
  static BorderRadius customBorderRadius = isLtr
      ? const BorderRadius.only(
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        )
      : const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        );

  static Future<DateTime> pickDate() async {
    final date = await showDatePicker(
      context: Get.overlayContext,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    print(
        'Selected date : ${intl.DateFormat.yMMMMd(AppUtil.currentLocale.toString()).format(date)}');
    return DateTime.utc(date.year, date.month, date.day, 12);
  }

  static Future<DateTime> pickTime({String helpText}) async {
    final result = await showTimePicker(
      context: Get.overlayContext,
      helpText: helpText,
      initialTime: TimeOfDay.now(),
    );
    print('Selected time : $result');
    final date = DateTime.now();
    final time = DateTime(
      date.year,
      date.month,
      date.day,
      result.hour,
      result.minute,
    );
    return time;
  }

  static void showAlertSnack({
    String title,
    String body,
    bool isGood = false,
    void Function() onTapSnack,
    Duration duration,
    String buttonText,
    void Function() onTapButton,
    SnackPosition snackPosition,
  }) {
    Get.snackbar(
      title ?? S.current.alert,
      body ?? '',
      snackPosition: snackPosition ?? SnackPosition.BOTTOM,
      padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 15.0),
      onTap: (_) => onTapSnack?.call(),
      duration: duration,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      backgroundColor: ColorUtil.whiteColor,
      titleText: Text(
        title ?? S.current.alert,
        style: TextStyle(
          color: isGood ? Colors.green : ColorUtil.errorColor,
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
        ),
      ),
      messageText: Text(
        body,
        style: const TextStyle(
          color: ColorUtil.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
      ),
      icon: Icon(
        isGood
            ? CupertinoIcons.checkmark_seal
            : CupertinoIcons.exclamationmark_octagon,
        color: isGood ? Colors.green : ColorUtil.errorColor,
      ),
      borderRadius: 5.0,
      mainButton: buttonText == null
          ? null
          : TextButton(
              onPressed: () => onTapSnack?.call(),
              style: TextButton.styleFrom(
                elevation: 3.0,
                backgroundColor: ColorUtil.primaryColor,
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  color: ColorUtil.errorColor,
                ),
              ),
            ),
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  static Future<bool> showAlertDialog({
    String title,
    String body,
    Function onConfirm,
    String confirmText,
    bool enableCancel = false,
    String cancelText,
    RxBool loading,
    Widget child,
  }) async {
    return Get.defaultDialog<bool>(
      title: title ?? S.current.alert,
      content: Directionality(
        textDirection: AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
        child: child ??
            Text(
              body ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
              maxLines: 10,
              softWrap: true,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
      ),
      titleStyle: TextStyle(
        color: ColorUtil.errorColor,
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
      actions: [
        if (enableCancel) ...[
          InkWell(
            onTap: () => Get.back(result: false),
            child: Text(
              cancelText ?? S.current.cancel,
              style: TextStyle(
                color: ColorUtil.errorColor,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
          const SizedBox(
            width: 75.0,
          ),
        ],
        InkWell(
          onTap: () {
            Get.back(result: true);
            onConfirm?.call();
          },
          child: Text(
            confirmText ?? S.current.done,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w700,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    );
  }

  static Future<List<File>> pickFiles({
    bool allowMultiple = false,
    FileType fileType = FileType.any,
  }) async {
    List<File> files = <File>[];
    try {
      final FilePickerResult result = await FilePicker.platform.pickFiles(
        allowMultiple: allowMultiple,
        type: fileType,
        allowCompression: true,
      );
      if (result != null) {
        for (final file in result?.files) {
          print(file.name);
          print(file.path);
          final compressedFile = await compressFile(File(file.path), file.name);
          files.add(compressedFile);
        }
      }
    } catch (e) {
      print('FilePicker error : ${e.toString()}');
    }
    return files;
  }

  static Future<File> compressFile(File file, String filename) async {
    final dir = await getTemporaryDirectory();
    file.writeAsBytesSync(file.readAsBytesSync().buffer.asUint8List());
    final targetPath = "${dir.absolute.path}${"/$filename"}";
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 50,
    );
    print(file.lengthSync());
    print(result.lengthSync());
    return result;
  }

  static Future<void> openMap({
    double latitude,
    double longitude,
  }) async {
    try {
      String target = 'مستشفى';
      if (latitude != null && longitude != null) {
        target = '$latitude,$longitude';
      } else if (AppUtil.isLtr) {
        target = 'Hospital';
      } else {
        target = 'مستشفى';
      }
      final url = 'https://www.google.com/maps/search/?api=1&query=$target';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('error');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> callPhone(
    BuildContext context, {
    @required List<String> phoneNumbers,
  }) async {
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            actions: <Widget>[
              ...phoneNumbers.map((e) {
                final url = 'tel://$e';
                return CupertinoActionSheetAction(
                  onPressed: () async {
                    try {
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: ColorUtil.primaryColor,
                    ),
                  ),
                );
              }).toList(),
            ],
            cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Get.back(result: true);
              },
              child: Text(
                S.current.cancel,
              ),
            ),
          );
        },
      );
    } else {
      await Get.bottomSheet(
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: ListView.builder(
            itemCount: phoneNumbers.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final url = 'tel://${phoneNumbers[index]}';
              return ListTile(
                title: Text(
                  phoneNumbers[index],
                  style: const TextStyle(
                    color: ColorUtil.primaryColor,
                  ),
                ),
                onTap: () async {
                  try {
                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  } catch (e) {
                    print(e.toString());
                  }
                },
              );
            },
          ),
        ),
      );
    }
  }

  static Future<void> openMapsSheet(
    BuildContext context, {
    @required List<Address> addresses,
  }) async {
    if (Platform.isIOS) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            actions: <Widget>[
              ...addresses.map((e) {
                final url =
                    'https://www.google.com/maps/search/?api=1&query=${e.lat},${e.long}';
                return CupertinoActionSheetAction(
                  onPressed: () async {
                    try {
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  child: Text(
                    e?.formattedAddress ?? '',
                    style: const TextStyle(
                      color: ColorUtil.primaryColor,
                    ),
                  ),
                );
              }).toList(),
            ],
            cancelButton: CupertinoActionSheetAction(
              isDefaultAction: true,
              onPressed: () {
                Get.back(result: true);
              },
              child: Text(
                S.current.cancel,
              ),
            ),
          );
        },
      );
    } else {
      await Get.bottomSheet(
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: ListView.builder(
            itemCount: addresses.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final url =
                  'https://www.google.com/maps/search/?api=1&query=${addresses[index].lat},${addresses[index].long}';
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      addresses[index].formattedAddress,
                      style: const TextStyle(
                        color: ColorUtil.primaryColor,
                      ),
                    ),
                    leading: const Icon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: ColorUtil.primaryColor,
                      size: 24.0,
                    ),
                    onTap: () async {
                      try {
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                  ),
                  const Divider(
                    color: ColorUtil.mediumGrey,
                  ),
                ],
              );
            },
          ),
        ),
      );
    }
  }

  static Future<Position> getCurrentLocation() async {
    Position position;
    try {
      final LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.requestPermission();
      }
      final geo = GeolocatorPlatform.instance;
      position = await geo.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print('User location : (${position.latitude},${position.longitude})');
    } catch (e) {
      print('Geolocator error : (${e.toString()})');
    }
    return position;
  }

  static Future<int> showRateDialog(String docName) async {
    final rate = RxDouble();
    await showAlertDialog(
      title: S.current.rating,
      child: Column(
        children: [
          Text(
            S.current.docNameRating(docName ?? '-'),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 16.0,
            ),
            maxLines: 10,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 20.0,
          ),
          Obx(
            () => Directionality(
              textDirection: TextDirection.ltr,
              child: SmoothStarRating(
                allowHalfRating: false,
                onRated: (v) {
                  rate(v);
                },
                rating: rate?.value ?? 0.0,
                size: 40.0,
                color: Colors.amber,
                borderColor: ColorUtil.mediumGrey,
              ),
            ),
          ),
        ],
      ),
    );
    return rate?.value?.round();
  }
}
