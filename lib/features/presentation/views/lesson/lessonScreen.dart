import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/lesson_model.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonScreenAppBar.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonVideoCard.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonsListView.dart';

class LessonScreen extends StatelessWidget {
  final Course? courseModel;

  const LessonScreen({super.key, this.courseModel});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LessonModel>>(
        stream: LayoutCubit.get(context).getLessonsCourses(
            mainCategory: courseModel!.mainCategory,
            courseId: courseModel!.courseId,
            subCategory: courseModel!.subCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: mixedColor,
              ),
            );
          }
          print('Ahmeddddddddddd${snapshot.data}');
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: Scaffold(
              body: Column(
                children: [
                  lessonScreenAppBar(courseModel!.name),
                  // lessonVideoCard(
                  //     video: snapshot.data!.length == 0
                  //         ? courseModel!.previewVideo
                  //         : snapshot.data![0].video),
                  lessonVideoCard(
                      video: courseModel!.previewVideo),
                  lessonsListView(lessonModel: snapshot.data!)
                ],
              ),
            ),
          );
        });
  }
}
