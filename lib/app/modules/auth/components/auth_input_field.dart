import 'package:careve/app/components/app_text_field.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool loading;
  final bool hidePassword;
  final bool isPassword;
  final bool isPhone;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onFieldSubmitted;
  final TextInputType keyBoardType;
  final FormFieldValidator<String> validator;
  final Function changeObscuring;
  final Widget suffix;

  const AuthInputField(
    this.label,
    this.controller, {
    this.validator,
    this.keyBoardType,
    this.isPhone = false,
    this.isPassword = false,
    this.hintText = '',
    this.onChanged,
    this.onFieldSubmitted,
    this.hidePassword = false,
    this.changeObscuring,
    this.loading = false,
    this.suffix,
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
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller,
                validator: validator,
                changeObscuring: changeObscuring,
                hidePassword: hidePassword,
                hintText: hintText,
                isPassword: isPassword,
                keyBoardType: keyBoardType,
                readOnly: loading,
                onChanged: onChanged,
                onFieldSubmitted: onFieldSubmitted,
                prefixWidget: !isPhone
                    ? null
                    : const Text(
                        '+20',
                        style: TextStyle(
                          color: ColorUtil.blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
              ),
            ),
            if (suffix != null) suffix
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
