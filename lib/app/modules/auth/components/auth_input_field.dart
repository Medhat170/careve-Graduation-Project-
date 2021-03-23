import 'package:careve/app/components/appTextField.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool loading;
  final bool hidePassword;
  final bool isPassword;
  final TextInputType keyBoardType;
  final FormFieldValidator<String> validator;
  final Function changeObscuring;

  AuthInputField(
    this.label,
    this.controller, {
    @required this.validator,
    this.keyBoardType,
    this.isPassword = false,
    this.hintText = '',
    this.hidePassword = false,
    this.changeObscuring,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: TextStyle(
            fontSize: 40.sp,
            color: ColorUtil.mediumGrey,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        AppTextField(
          controller,
          validator: validator,
          changeObscuring: changeObscuring,
          hidePassword: hidePassword,
          hintText: hintText,
          isPassword: isPassword,
          keyBoardType: keyBoardType,
          readOnly: loading,
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
