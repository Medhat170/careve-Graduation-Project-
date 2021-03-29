import 'package:flutter/material.dart';

import 'HeaderTextStyle.dart';
import 'StepTextStyle.dart';

class ForthStepContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HeaderTextStyle(
        headerContent: 'The fourth step (in the shower)',
      ),
      SizedBox(
        height: 10,
      ),
      StepTextStyle(
        stepContent:
            'The previous test was re-examined in the same way as in the shower.',
      ),
    ]);
  }
}
