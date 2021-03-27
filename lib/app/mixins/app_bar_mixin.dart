import 'package:careve/app/components/appTextField.dart';
import 'package:careve/app/utilities/appUtil.dart';
import 'package:careve/app/utilities/colorUtil.dart';
import 'package:careve/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin CustomAppBar {
  final TextEditingController searchText = TextEditingController();
  final startSearching = false.obs;

  Widget customAppBar(
    String title, {
    bool enableBack = false,
    bool enableSearch = false,
    Widget trailing,
    int trailingCount,
  }) {
    if (startSearching.value) {
      return searchAppBar();
    } else {
      return originalAppBar(
        enableBack,
        enableSearch,
        title,
        trailing,
        trailingCount,
      );
    }
  }

  Widget originalAppBar(
    bool enableBack,
    bool enableSearch,
    String barTitle,
    Widget trailing,
    int trailingCount,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        right: AppUtil.isLtr ? 10.0 : 2.0,
        left: AppUtil.isLtr ? 2.0 : 10.0,
        top: 9.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          enableBack
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: ColorUtil.primaryColor,
                    size: 22.0,
                  ),
                  onPressed: () => Get.back(result: true),
                )
              : SizedBox.shrink(),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            child: Text(
              barTitle,
              style: TextStyle(
                color: ColorUtil.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 60.sp,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (enableSearch)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: GestureDetector(
                onTap: () {
                  startSearching(true);
                },
                child: CircleAvatar(
                  backgroundColor: ColorUtil.lightGrey,
                  radius: 14,
                  child: Icon(
                    FontAwesomeIcons.search,
                    color: ColorUtil.primaryColor,
                    size: 16.0,
                  ),
                ),
              ),
            ),
          trailing != null
              ? trailing
              : trailingCount == null || trailingCount == 0
                  ? SizedBox.shrink()
                  : CircleAvatar(
                      backgroundColor: ColorUtil.primaryColor,
                      radius: 14,
                      child: FittedBox(
                        child: Text(
                          trailingCount.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }

  Widget searchAppBar() {
    return Padding(
      padding: EdgeInsets.only(
        right: AppUtil.isLtr ? 10.0 : 2.0,
        left: AppUtil.isLtr ? 2.0 : 10.0,
        top: 9.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.times,
              color: ColorUtil.primaryColor,
              size: 22.0,
            ),
            onPressed: () => startSearching(false),
          ),
          Expanded(
            child: SizedBox(
              height: 36.0,
              child: AppTextField(
                searchText,
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
            ),
          ),
        ],
      ),
    );
  }
}