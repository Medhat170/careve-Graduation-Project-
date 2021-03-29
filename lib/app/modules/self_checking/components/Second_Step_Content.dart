import 'package:careve/app/utilities/pathUtil.dart';
import 'package:flutter/material.dart';
import 'HeaderTextStyle.dart';
import 'StepTextStyle.dart';

class SecondScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderTextStyle(
            headerContent: 'The second step (in front of the mirror)'),
        SizedBox(
          height: 10,
        ),
        StepTextStyle(
            stepContent:
                '1-Raise your hands up and make sure there are no previous changes'),
        SizedBox(
          height: 20,
        ),
        StepTextStyle(
            stepContent:
                '2-While raising your hands up, notice the discharge of any abnormal secretions or blood from the right or left nipples.'),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Column(
            children: [
              StepTextStyle(stepContent: 'Abnormal secretions or blood'),
              SizedBox(
                height: 10,
              ),
              Image(
                image: AssetImage(PathUtil.protrusionOfOrdinatorImage),
              )
            ],
          ),
        ),
      ],
    );
  }
}
