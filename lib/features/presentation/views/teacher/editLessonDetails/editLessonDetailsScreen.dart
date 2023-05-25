import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/features/data/models/lesson_model.dart';

import 'components/editLessonDetailsScreenAppBar.dart';
import 'components/editTextFieldsList.dart';

class editLessonDetails extends StatelessWidget {
  final LessonModel lessonModel;
  final int index;

  const editLessonDetails({super.key, required this.lessonModel, required this.index});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              editLessonDetailsScreenAppBar(),
              editTextFieldsList(index: index,lessonModel: lessonModel),
            ],
          ),
        ),
      ),
    );
  }
}
