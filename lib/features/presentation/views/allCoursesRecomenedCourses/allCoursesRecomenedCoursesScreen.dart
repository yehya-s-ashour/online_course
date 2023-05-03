import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/components/allCoursesRecomenedCoursesScreenListView.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/components/allCoursesScreenAppBar.dart';

class AllCoursesRecomenedCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            allCoursesRecomenedCoursesScreenAppBar(),
            allCoursesRecomenedCoursesScreenListView()
          ],
        ),
      ),
    );
  }
}
