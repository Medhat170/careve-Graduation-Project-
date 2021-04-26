import 'dart:io';

import 'package:careve/app/utilities/color_util.dart';
import 'package:careve/generated/l10n.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart' as intl;
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
    print('Selected date : ${intl.DateFormat.yMMMMd().format(date)}');
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
    void Function() onTap,
    Duration duration,
  }) {
    Get.snackbar(
      title,
      body,
      onTap: (_) => onTap?.call(),
      duration: duration,
      backgroundColor: Colors.white,
      titleText: Text(
        title,
        style: TextStyle(
          color: isGood ? Colors.green : Colors.red,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
      ),
      messageText: Text(
        body,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
      ),
      icon: Icon(
        isGood ? Icons.check_circle_outline : Icons.error_outline,
        color: isGood ? Colors.green : Colors.red,
      ),
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
  }) async {
    return Get.defaultDialog<bool>(
      title: title ?? S.current.alert,
      content: Directionality(
        textDirection: AppUtil.isLtr ? TextDirection.ltr : TextDirection.rtl,
        child: Text(
          body ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
          maxLines: 10,
          softWrap: true,
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
            if (onConfirm != null) {
              onConfirm();
            }
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
      );
      if (result != null) {
        files = result.files.map(
          (file) {
            print(file.name);
            print(file.path);
            return File(file.path);
          },
        ).toList();
      }
    } catch (e) {
      print('FilePicker error : ${e.toString()}');
    }
    return files;
  }

  static Future<void> openMapsSheet({
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
}
