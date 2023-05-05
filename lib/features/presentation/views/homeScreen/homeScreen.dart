import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/homeAppBar.dart';
import 'components/onGoingCourse/onGoingCourses.dart';
import 'components/recommendedCourses.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              homeAppBar(context),
              onGoingCourses(),
              recommendedCourses(),
            ],
          ),
        ),
      ),
    );
  }
}
