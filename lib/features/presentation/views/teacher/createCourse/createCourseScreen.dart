import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/createCourseScreenAppBar.dart';
import 'components/editTextFieldsList.dart';

class createCourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [createCourseScreenAppBar(), editTextFieldsList()],
          ),
        ),
      ),
    );
  }
}
