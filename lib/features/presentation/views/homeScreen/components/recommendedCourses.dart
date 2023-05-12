import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/allCoursesRecomenedCoursesScreen.dart';
import 'package:online_course/features/presentation/views/homeScreen/components/courseCard.dart';

class recommendedCourses extends StatelessWidget {
  recommendedCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Column(
          children: [
            SizedBox(height: 3.h),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16),
              child: Row(
                children: [
                  Text(
                    "Recomended Courses",
                    style: TextStyle(
                        fontSize: 20.spMin,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(AllCoursesRecomenedCoursesScreen());
                    },
                    child: Text(
                      "View All",
                      style: TextStyle(
                        fontSize: 17.spMin,
                        color: mixedColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 15.w),
              child: SizedBox(
                height: 30.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          cubit.changeIndex(index);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.h),
                          decoration: BoxDecoration(
                            color: index != cubit.currentindex
                                ? Colors.black.withOpacity(.1)
                                : mixedColor,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              nameCourses[index],
                              style: GoogleFonts.cairo(
                                  fontSize: 15.spMin,
                                  color: index !=
                                          LayoutCubit.get(context).currentindex
                                      ? Colors.black.withOpacity(.6)
                                      : Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 7.w,
                      );
                    },
                    itemCount: nameCourses.length),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            SizedBox(
              height: 350.h,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 15.w,
                  vertical: 1.h,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 13.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 0.9
                ),
                itemBuilder: (context, index) {
                  return CourseCardd(
                    courseModel: cubit.currentindex == 0
                        ? cubit.businessCourses[index]
                        : cubit.currentindex == 1
                            ? cubit.developmentCourses[index]
                            : cubit.currentindex == 2
                                ? cubit.marketingCourses[index]
                                : cubit.currentindex == 3
                                    ? cubit.personalDevelopmentCourses[index]
                                    : cubit.teachingAcademicsCourses[index],
                  );
                },
                itemCount: cubit.currentindex == 0
                    ? cubit.businessCourses.length
                    : cubit.currentindex == 1
                        ? cubit.developmentCourses.length
                        : cubit.currentindex == 2
                            ? cubit.marketingCourses.length
                            : cubit.currentindex == 3
                                ? cubit.personalDevelopmentCourses.length
                                : cubit.teachingAcademicsCourses.length,
              ),
            ),
          ],
        );
      },
      listener: (context, state) {},
    );
  }
}

List<String> nameCourses = [
  'Business',
  'Development',
  'Marketing',
  'Personal Development',
  'Teaching & Academics',
];
