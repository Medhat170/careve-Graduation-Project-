import 'package:careve/app/utilities/appUtil.dart';
import 'package:flutter/material.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final bool hidePassword;
  final bool isPassword;
  final Widget suffixWidget;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onSaved;
  final ValueChanged<String> onChanged;
  final String hintText;
  final int maxLines;
  final TextAlign textAlignment;
  final TextInputType keyBoardType;
  final double fontSize;
  final Function changeObscuring;

  AppTextField(
    this.controller, {
    this.hidePassword = true,
    this.isPassword = false,
    this.suffixWidget,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.hintText = '',
    this.textAlignment = TextAlign.start,
    this.keyBoardType = TextInputType.text,
    this.fontSize = 16,
    this.changeObscuring,
    this.readOnly = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      readOnly: readOnly,
      onSaved: onSaved,
      style: TextStyle(
        color: ColorUtil.primaryColor,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
      ),
      textAlign: textAlignment,
      textInputAction: TextInputAction.done,
      cursorColor: ColorUtil.primaryColor,
      keyboardType: keyBoardType,
      maxLines: maxLines,
      obscureText: hidePassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorUtil.lightGrey,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        suffix: isPassword
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: changeObscuring,
                  child: Icon(
                    !hidePassword
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    size: 16.0,
                    color: ColorUtil.mediumGrey,
                  ),
                ),
              )
            : null,
        alignLabelWithHint: true,
        enabledBorder: AppUtil.transparentUOutLineInputBorder,
        disabledBorder: AppUtil.transparentUOutLineInputBorder,
        focusedBorder: AppUtil.transparentUOutLineInputBorder,
        border: AppUtil.transparentUOutLineInputBorder,
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorUtil.mediumGrey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
