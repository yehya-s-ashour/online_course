import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/features/data/models/courseEnroll_model.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';
import 'package:online_course/features/presentation/views/my_courses/comounents/myCoursesAppBar.dart';
import 'package:online_course/features/presentation/views/my_courses/comounents/upperCard.dart';

import 'comounents/myCoursesListView.dart';

class MyCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CourseEnrollModel>>(
      stream: LayoutCubit.get(context).getCoursesEnroll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Column(
              children: [myCoursesAppBar(), upperCard(), myCoursesListView()],
            ),
          );
        }
        return BlocConsumer<LayoutCubit,LayoutState>(builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [myCoursesAppBar(), upperCard(), myCoursesListView()],
            ),
          );
        }, listener: (context, state) {

        },);
      },

    );
  }
}
