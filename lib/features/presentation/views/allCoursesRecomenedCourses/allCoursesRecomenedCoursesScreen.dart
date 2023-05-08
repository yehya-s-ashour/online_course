import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/components/allCoursesRecomenedCoursesScreenListView.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/components/allCoursesScreenAppBar.dart';

class AllCoursesRecomenedCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LayoutCubit.get(context).getAllCourses();
    return BlocConsumer<LayoutCubit,LayoutState>(builder: (context, state) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Column(
            children: [
              allCoursesRecomenedCoursesScreenAppBar(),
              allCoursesRecomenedCoursesScreenListView(context: context)
            ],
          ),
        ),
      );
    }, listener: (context, state) {

    },);
  }
}
