import 'dart:io';

import 'package:careve/app/utilities/color_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Platform.isAndroid
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorUtil.primaryColor,
                ),
              )
            : const CupertinoActivityIndicator(),
      ),
    );
  }
}
