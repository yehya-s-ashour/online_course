import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/createLessonScreenAppBar.dart';
import 'components/editTextFieldsList.dart';

class createLessonScreen extends StatelessWidget {
  final int index;

  const createLessonScreen({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [createLessonScreenAppBar(), editTextFieldsList(index: index,)],
          ),
        ),
      ),
    );
  }
}
