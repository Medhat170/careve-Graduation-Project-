import 'package:careve/app/utilities/app_util.dart';
import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/material.dart';

class AppDropDownMenu extends StatelessWidget {
  final String hintText;
  final Function onChanged;
  final List<String> listElements;
  final FormFieldValidator<String> validator;

  const AppDropDownMenu({
    this.hintText = '',
    this.onChanged,
    @required this.listElements,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    String currentValue;
    return FormField<String>(
      validator: validator,
      builder: (FormFieldState<String> state) {
        return Container(
          decoration: BoxDecoration(
            color: ColorUtil.lightGrey,
            borderRadius: AppUtil.borderRadius,
          ),
          child: InputDecorator(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 0.5,
                ),
                borderRadius: AppUtil.borderRadius,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorUtil.lightGrey,
                  width: 0.5,
                ),
                borderRadius: AppUtil.borderRadius,
              ),
              disabledBorder: AppUtil.lightGreyOutLineInputBorder,
              enabledBorder: AppUtil.lightGreyOutLineInputBorder,
              errorStyle: TextStyle(
                color: ColorUtil.errorColor,
                fontSize: 12.0,
              ),
              hintStyle: const TextStyle(
                color: ColorUtil.mediumGrey,
                fontSize: 14.0,
              ),
              hintText: hintText,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: currentValue,
                isDense: true,
                onChanged: (String value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  onChanged(value);
                },
                hint: FittedBox(
                  child: Text(
                    currentValue ?? hintText,
                    style: const TextStyle(
                      color: ColorUtil.mediumGrey,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
                iconDisabledColor: ColorUtil.lightGrey,
                iconEnabledColor: ColorUtil.lightGrey,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: ColorUtil.mediumGrey,
                ),
                items: listElements.map(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: ColorUtil.primaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
