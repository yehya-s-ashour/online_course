import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/utils/data.dart';
import 'package:online_course/features/presentation/views/couse_detail/course_detail_screen.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key, required this.department}) : super(key: key);
  final Department1 department;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kWhiteColor,
            pinned: true,
            snap: true,
            floating: true,
            centerTitle: true,
            actions: [],
            title: Text(
              department.name,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kDBackGColor),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildColumn(),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget buildColumn() {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: 15.w, right: 15.w),
      child: Column(
        children: [
          ...List.generate(
              department.courses.length,
              (index) => InkWell(
                    onTap: () {
                      Get.to(() => CourseDetailScreen(
                          course: department.courses[index]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                          margin: EdgeInsets.zero,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: kLightBgColor.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  padding: EdgeInsets.all(5.r),
                                  child: Image.asset(
                                    department.courses[index].image,
                                    width: 1.sw,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  )),
                              Container(
                                  decoration: BoxDecoration(
                                    color: kDBackGColor.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  padding: EdgeInsets.all(20.r),
                                  child: Text(
                                    department.courses[index].name,
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: kWhiteColor),
                                  )),
                            ],
                          )),
                    ),
                  )),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
