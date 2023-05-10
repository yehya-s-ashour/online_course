import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/lesson_model.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonScreenAppBar.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonVideoCard.dart';

class LessonScreen extends StatelessWidget {
  final String mainCategory;
  final String courseId;
  final String subCategory;
  final String name;
  final String previewVideo;

  const LessonScreen({super.key, required this.mainCategory, required this.courseId, required this.subCategory, required this.name, required this.previewVideo,});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LessonModel>>(
        stream: LayoutCubit.get(context).getLessonsCourses(
            mainCategory: mainCategory,
            courseId: courseId,
            subCategory: subCategory),
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
                  lessonScreenAppBar(name),
                  lessonVideoCard(
                      video: snapshot.data!.length == 0
                          ? previewVideo
                          : snapshot.data![0].video),
                  // lessonVideoCard(
                  //     video: previewVideo),
                  // lessonsListView(lessonModel: snapshot.data!)
                ],
              ),
            ),
          );
        });
  }
}
