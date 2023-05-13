import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/my_courses/comounents/myCoursesCourseCard.dart';

class myCoursesListView extends StatelessWidget {
  const myCoursesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 15),
          child: Text(
            "Enrolled Courses",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22.spMin,
                color: Colors.black),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 15.w),
          child: SizedBox(
            height: 25.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      LayoutCubit.get(context).changeIndexEnrolled(index);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.h),
                      decoration: BoxDecoration(
                        color: index != LayoutCubit.get(context).currentindexEnrolled
                            ? Colors.black.withOpacity(.1)
                            : mixedColor,
                        borderRadius: BorderRadius.circular(7.r),
                      ),
                      child: Center(
                        child: Text(
                          list[index],
                          style: GoogleFonts.cairo(
                              fontSize: 15.spMin,
                              color: index !=
                                  LayoutCubit.get(context).currentindexEnrolled
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
                    width: 10.w,
                  );
                },
                itemCount: list.length),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 320.h,
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 1.h,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .95,
              crossAxisSpacing: 13.w,
              mainAxisSpacing: 15.h,
            ),
            itemBuilder: (context, index) {
              return myCoursesCourseCard(
                course: LayoutCubit.get(context).currentindexEnrolled==0?LayoutCubit.get(context).onGoginEnrollModel[index]:LayoutCubit.get(context).completedEnrollModel[index],
              );
            },
            itemCount: LayoutCubit.get(context).currentindexEnrolled==0?LayoutCubit.get(context).onGoginEnrollModel.length:LayoutCubit.get(context).completedEnrollModel.length,
          ),
        ),
      ],
    );
  }
}

List<String> list = [
  'Ongoing',
  'Completed',
];
