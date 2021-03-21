import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:get/get.dart';


class AppUtil {
  static final RegExp emailValidatorRegExp =
  RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
  static final RegExp phoneValidatorRegExp = RegExp(r'^\+?[0-9]{10,}$');
  static BorderRadius borderRadius = BorderRadius.circular(10.0);
  static BorderRadius borderRadius50 = BorderRadius.circular(50);
  static UnderlineInputBorder transparentUnderLineInputBorder =
  UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0.5,
    ),
  );
  static ThemeData appTheme = ThemeData(
    fontFamily: 'Segoe UI',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static bool get isLtr => intl.Intl.getCurrentLocale() == 'en';

  static BorderRadius customBorderRadius = isLtr
      ? BorderRadius.only(
    topRight: Radius.circular(10.0),
    bottomRight: Radius.circular(10.0),
  )
      : BorderRadius.only(
    bottomLeft: Radius.circular(10.0),
    topLeft: Radius.circular(10.0),
  );

  static Future<DateTime> pickDate([DateTime initialDate]) async {
    initialDate ??= DateTime.now();
    final date = await showDatePicker(
      context: Get.overlayContext,
      firstDate: DateTime.fromMillisecondsSinceEpoch(0, isUtc: true),
      lastDate: initialDate.add(Duration(days: 20 * 365)),
      initialDate: initialDate ?? DateTime.now(),
    );
    print('Selected date : ' + intl.DateFormat.yMMMMd().format(date));
    if (date != null) {
      return DateTime.utc(date.year, date.month, date.day, 12);
    } else {
      return initialDate;
    }
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
        style: TextStyle(
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
  //
  // static Future<bool> showAlertDialog({
  //   String title,
  //   String body,
  //   Function onConfirm,
  //   String confirmText,
  //   bool enableCancel = false,
  //   String cancelText,
  //   RxBool loading,
  // }) async {
  //   return await Get.defaultDialog<bool>(
  //     title: S.current.alert ?? title,
  //     content: AppDirectionality(
  //       child: Text(
  //         body ?? '',
  //         style: TextStyle(
  //           color: Colors.black,
  //           fontWeight: FontWeight.w500,
  //           fontSize: 16.0,
  //         ),
  //         maxLines: 10,
  //         softWrap: true,
  //         overflow: TextOverflow.ellipsis,
  //       ),
  //     ),
  //     titleStyle: TextStyle(
  //       color: ColorUtil.errorColor,
  //       fontWeight: FontWeight.w700,
  //       fontSize: 24.0,
  //     ),
  //     actions: [
  //       if (enableCancel) ...[
  //         InkWell(
  //           onTap: () => Get.back(result: false),
  //           child: Text(
  //             cancelText ?? S.current.cancel,
  //             style: TextStyle(
  //               color: ColorUtil.errorColor,
  //               fontWeight: FontWeight.w500,
  //               fontSize: 18.0,
  //             ),
  //           ),
  //         ),
  //         const SizedBox(
  //           width: 75.0,
  //         ),
  //       ],
  //       InkWell(
  //         onTap: onConfirm ?? () => Get.back(result: true),
  //         child: Text(
  //           confirmText ?? S.current.done,
  //           style: TextStyle(
  //             color: ColorUtil.primaryColor,
  //             fontWeight: FontWeight.w500,
  //             fontSize: 18.0,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
