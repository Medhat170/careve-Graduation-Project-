import 'package:flutter/material.dart';

import 'HeaderTextStyle.dart';
import 'StepTextStyle.dart';

class ThirdStepContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTextStyle(headerContent: 'The third step (in the bed)'),
        SizedBox(
          height: 10,
        ),
        StepTextStyle(
            stepContent:
                '1-Lie on the bed and use the left hand to examine the right breast and right hand to examine the left breast'),
        SizedBox(
          height: 20,
        ),
        StepTextStyle(
            stepContent:
                ' 2-Using your fingertips and through a circular movement, check the breast (skin and tissues)'),
        SizedBox(
          height: 20,
        ),
        StepTextStyle(
            stepContent:
                '3-Make sure the breast is fully examined from the top to the bottom and side to side- from the collarbone to the top of your abdomen and from the armpit to the middle of the chest'),
        SizedBox(
          height: 20,
        ),
        StepTextStyle(
            stepContent:
                '4-Until you make sure the breast is fully examined, you can start from the nipple and then move in larger and larger circles until you reach the outer area of the breast.'),
        SizedBox(
          height: 20,
        ),
        HeaderTextStyle(
            headerContent: 'Notice the feeling of any of the following signs,'),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StepTextStyle(stepContent: '-Feeling of armpit tumor'),
                  StepTextStyle(stepContent: '- feeling of general'),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StepTextStyle(stepContent: '-thickness - breast pain'),
                  StepTextStyle(stepContent: '- perceptual tumor'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
