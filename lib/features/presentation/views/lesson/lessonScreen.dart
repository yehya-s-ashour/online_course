import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonScreenAppBar.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonVideoCard.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonsListView.dart';

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            lessonScreenAppBar(),
            lessonVideoCard(),
            lessonsListView()
          ],
        ),
      ),
    );
  }
}
