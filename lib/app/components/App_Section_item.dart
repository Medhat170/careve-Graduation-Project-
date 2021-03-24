import 'package:flutter/material.dart';
import 'package:careve/app/utilities/colorUtil.dart';

class AppSectionItem extends StatelessWidget {
  final String name;
  final String image;

  AppSectionItem({
    this.name,
    this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        Container(
          width: 140,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorUtil.transparentPink,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: ColorUtil.whiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
