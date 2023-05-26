import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/lesson_model.dart';

import 'components/editLessonDetailsScreenAppBar.dart';
import 'components/editTextFieldsList.dart';

class editLessonDetails extends StatelessWidget {
  final LessonModel lessonModel;
  final int index;

  const editLessonDetails(
      {super.key, required this.lessonModel, required this.index});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        floatingActionButton: Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete_outline_outlined),
            color: Colors.white,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              editLessonDetailsScreenAppBar(),
              editTextFieldsList(index: index, lessonModel: lessonModel),
            ],
          ),
        ),
      ),
    );
  }
}
