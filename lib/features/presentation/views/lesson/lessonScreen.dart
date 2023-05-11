import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/lesson_model.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';
import 'package:online_course/features/presentation/views/cours_berfore_enrolling/components/courseVideoCard.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonScreenAppBar.dart';
import 'package:online_course/features/presentation/views/lesson/components/lessonsListView.dart';

class LessonScreen extends StatelessWidget {
  final String mainCategory;
  final String courseId;
  final String subCategory;
  final String name;
  final String previewVideo;

  const LessonScreen({
    super.key,
    required this.mainCategory,
    required this.courseId,
    required this.subCategory,
    required this.name,
    required this.previewVideo,
  });

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
                  BlocConsumer<LayoutCubit, LayoutState>(
                    builder: (context, state) {
                      print(
                          'Awsssss${LayoutCubit.get(context).indexVideoLesson}');
                      return Column(
                        children: [
                          lessonScreenAppBar(LayoutCubit.get(context).indexVideoLesson==-1?'':snapshot
                              .data![LayoutCubit.get(context).indexVideoLesson]
                              .name,courseId,context),
                          courseVideoCard(
                          courseId: courseId,
                              numberSt: 2,
                              rate: 2,
                              VideoPaht:LayoutCubit.get(context).indexVideoLesson==-1?previewVideo: snapshot
                                  .data![
                                      LayoutCubit.get(context).indexVideoLesson]
                                  .video,
                              isLesson: true),
                        ],
                      );
                    },
                    listener: (context, state) {},
                  ),
                  lessonsListView(lessonModel: snapshot.data!,mainCategory: mainCategory,subCategory: subCategory)
                ],
              ),
            ),
          );
        });
  }
}
