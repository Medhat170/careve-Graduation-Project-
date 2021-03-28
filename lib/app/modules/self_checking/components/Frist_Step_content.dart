import 'package:careve/app/modules/self_checking/components/StepTextStyle.dart';
import 'package:flutter/material.dart';
import 'HeaderTextStyle.dart';

class FirstStepContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderTextStyle(
            headerContent: 'The first step (in front of the mirror)'),
        SizedBox(
          height: 5,
        ),
        StepTextStyle(
            stepContent:
                '1-Look at the breasts in the mirror with your hands in a straight position on the sides and than put yourhands on the middle'),
        SizedBox(
          height: 5,
        ),
        StepTextStyle(
            stepContent:
                '2-Make sure you look at the shape and color of the breast size and it is the usual for you without changing or without difference'),
        SizedBox(
          height: 20,
        ),
        HeaderTextStyle(
            headerContent: '- Notice of the following signs in the breast')
      ],
    );
  }
}
