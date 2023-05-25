import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/features/data/models/courses_model.dart';

import 'components/editCourseDetailsScreenAppBar.dart';
import 'components/editTextFieldsList.dart';

class editCourseDetails extends StatelessWidget {
  final CoursesModel course;

  const editCourseDetails({super.key, required this.course});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              editCourseDetailsScreenAppBar(),
              editTextFieldsList(course: course),
            ],
          ),
        ),
      ),
    );
  }
}
