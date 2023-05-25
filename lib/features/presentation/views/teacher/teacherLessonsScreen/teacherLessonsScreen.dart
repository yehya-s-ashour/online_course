import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/data/models/lesson_model.dart';
import 'package:online_course/features/presentation/controllers/teacher_cubit/TeacherCubit.dart';

import 'components/teacherLessonsListview.dart';
import 'components/teacherLessonsScreenAppBar.dart';

class teacherLessonsScreen extends StatelessWidget {
  final int index;

  const teacherLessonsScreen({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LessonModel>>(
      stream: TeacherCubit.get(context).getLessons(index: index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: mixedColor,
            ),
          );
        }
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            body: Column(
              children: [
                teacherLessonsScreenAppBar(name: teacherCourseslist[index].name,index: index),
                teacherLessonsListview(lessonModel: snapshot.data!,indexs: index),
              ],
            ),
          ),
        );
      },

    );
  }
}
