import 'package:flutter/material.dart';

class SelfCheckingDataComponent extends StatelessWidget {
  final String image;
  final Widget widget;
  SelfCheckingDataComponent({@required this.widget, @required this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(child: widget)
      ],
    );
  }
}
