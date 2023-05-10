import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/components/allCoursesRecomenedCoursesScreenCourseCard.dart';
import 'package:online_course/features/presentation/views/lesson/lessonScreen.dart';

Widget allCoursesRecomenedCoursesScreenListView({required BuildContext context}) {
  return Container(
    height: 620.h,
    child: GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 1.h,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9.h,
        crossAxisSpacing: 13.w,
        mainAxisSpacing: 15.h,
      ),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            Get.to(LessonScreen(courseId: LayoutCubit.get(context).allCourses[index].courseId,mainCategory: LayoutCubit.get(context).allCourses[index].mainCategory,name: LayoutCubit.get(context).allCourses[index].name,previewVideo: LayoutCubit.get(context).allCourses[index].previewVideo,subCategory: LayoutCubit.get(context).allCourses[index].subCategory,));
          },
          child: AllCoursesRecomenedCoursesScreenCourseCard(
            courseModel:LayoutCubit.get(context).allCourses[index],
          ),
        );
      },
      itemCount: LayoutCubit.get(context).allCourses.length,
    ),
  );
}
