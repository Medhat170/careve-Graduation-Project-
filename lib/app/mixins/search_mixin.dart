import 'package:careve/app/components/appTextField.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

mixin Search {
  final TextEditingController searchText = TextEditingController();

  Widget search() {
    return SizedBox(
      height: 30.0,
      child: AppTextField(
        searchText,
        autoFocus: false,
        disablePrefixColor: true,
        hintText: S.current.search,
        onFieldSubmitted: (String value) {
          print(searchText.text);
        },
        prefixWidget: Icon(
          FontAwesomeIcons.search,
          color: ColorUtil.mediumGrey,
          size: 16.0,
        ),
      ),
    );
  }
}
