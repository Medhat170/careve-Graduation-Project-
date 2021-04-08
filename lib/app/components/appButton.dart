import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CareveButton extends ButtonAppButton {
  CareveButton({
    Widget child,
    String title,
    double fontSize = 18.0,
    Color textColor = ColorUtil.whiteColor,
    Function onTap,
    double height,
    double width,
    EdgeInsets margin,
    Color borderColor,
    Color backgroundColor = ColorUtil.primaryColor,
    double elevation,
  }) : super(
          child ??
              FittedBox(
                child: Text(
                  title ?? '',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
              ),
          onTap: onTap,
          borderRadius: AppUtil.borderRadius,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          elevation: elevation,
          height: height,
          width: width,
          margin: margin,
        );

  factory CareveButton.icon({
    @required Widget icon,
    String title,
    Color textColor,
    Function onTap,
    double height,
    double width,
    EdgeInsets margin,
    Color borderColor,
    Color backgroundColor,
    double elevation,
  }) = _CareveButtonWithIcon;
}

class _CareveButtonWithIcon extends CareveButton {
  _CareveButtonWithIcon({
    @required Widget icon,
    @required String title,
    double fontSize = 18.0,
    Color textColor,
    Function onTap,
    double height,
    double width,
    EdgeInsets margin,
    Color borderColor,
    Color backgroundColor,
    double elevation,
  })  : assert(icon != null),
        super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              if (title != null)
                const SizedBox(
                  width: 7.5,
                ),
              if (title != null)
                FittedBox(
                  child: Text(
                    title ?? '',
                    style: TextStyle(
                      color: textColor ?? ColorUtil.whiteColor,
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                    ),
                  ),
                ),
            ],
          ),
          onTap: onTap,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          elevation: elevation,
          height: height,
          width: width,
          margin: margin,
        );
}

class ButtonAppButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Color backgroundColor;
  final Color borderColor;
  final double elevation;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final double height;
  final double width;

  const ButtonAppButton(
    this.child, {
    @required this.onTap,
    this.borderRadius,
    this.height,
    this.width,
    this.margin,
    this.borderColor,
    this.elevation,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        onTap();
      },
      child: Card(
        color: backgroundColor,
        elevation:
            backgroundColor == Colors.transparent ? 0.0 : (elevation ?? 6.5),
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        shadowColor: backgroundColor == Colors.white
            ? Colors.black54
            : backgroundColor.withOpacity(0.5),
        margin: margin,
        child: Container(
          width: width ?? Get.width,
          height: height ?? 50.0,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: backgroundColor,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
            ),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
