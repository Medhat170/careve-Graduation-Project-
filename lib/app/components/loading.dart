import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: kIsWeb
            ? CircularProgressIndicator()
            : Platform.isAndroid
                ? CircularProgressIndicator()
                : CupertinoActivityIndicator(),
      ),
    );
  }
}
