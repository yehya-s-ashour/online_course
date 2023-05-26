import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/courses_model.dart';
import 'package:online_course/features/presentation/controllers/teacher_cubit/TeacherCubit.dart';

import 'components/teacherCoursesList.dart';
import 'components/teacherCoursesScreenAppBar.dart';

class teacherCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CoursesModel>>(
      stream: TeacherCubit.get(context).getCourses(),
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
              children: [teacherCoursesScreenAppBar(context), teacherCoursesList()],
            ),
          ),
        );
      },

    );
  }
}
