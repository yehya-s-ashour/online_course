import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/utils/data.dart';
import 'package:online_course/features/data/models/roadmap_model.dart';
import 'package:online_course/features/presentation/components/custom_image.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/depart_screen/components/course_detail_screen.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key, required this.index}) : super(key: key);
  final int index;

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
              LayoutCubit.get(context).roadmap.keys.toList()[index],
              style: GoogleFonts.cairo(
                  fontSize: 20.spMin,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildColumn(
                  index: index,
                  roadmapModel: LayoutCubit.get(context)
                      .roadmap
                      .values
                      .toList()[this.index]),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget buildColumn({required RoadmapModel roadmapModel, required int index}) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: 15.w, right: 15.w),
      child: Column(
        children: [
          ...List.generate(5, (index) {
            if (index == 0) {
              return CoursesItem(
                index: index,
                data: Course1(
                  name: roadmapModel.name1,
                  image: roadmapModel.image1,
                ),
                width: 1.sw,
                height: 160.h,
                onTap: () {
                  Get.to(() => CourseDetailScreen(
                        image: roadmapModel.image1,
                        name: roadmapModel.name1,
                        description: roadmapModel.description1,
                      ));
                },
              );
            } else if (index == 1) {
              return CoursesItem(
                index: index,
                data: Course1(
                  name: roadmapModel.name2,
                  image: roadmapModel.image2,
                ),
                width: 1.sw,
                height: 160.h,
                onTap: () {
                  Get.to(() => CourseDetailScreen(
                      image: roadmapModel.image2,
                      name: roadmapModel.name2,
                      description: roadmapModel.description2));
                },
              );
            } else if (index == 2) {
              return CoursesItem(
                index: index,
                data: Course1(
                  name: roadmapModel.name3,
                  image: roadmapModel.image3,
                ),
                width: 1.sw,
                height: 160.h,
                onTap: () {
                  Get.to(() => CourseDetailScreen(
                      image: roadmapModel.image3,
                      name: roadmapModel.name3,
                      description: roadmapModel.description3));
                },
              );
            } else if (index == 3) {
              return CoursesItem(
                index: index,
                data: Course1(
                  name: roadmapModel.name4,
                  image: roadmapModel.image4,
                ),
                width: 1.sw,
                height: 160.h,
                onTap: () {
                  Get.to(() => CourseDetailScreen(
                      image: roadmapModel.image4,
                      name: roadmapModel.name4,
                      description: roadmapModel.description4));
                },
              );
            } else {
              return CoursesItem(
                index: index,
                data: Course1(
                  name: roadmapModel.name5,
                  image: roadmapModel.image5,
                ),
                width: 1.sw,
                height: 160.h,
                onTap: () {
                  Get.to(() => CourseDetailScreen(
                      image: roadmapModel.image5,
                      name: roadmapModel.name5,
                      description: roadmapModel.description5));
                },
              );
            }
          }),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }
}

class CoursesItem extends StatelessWidget {
  CoursesItem(
      {Key? key,
      required this.data,
      this.width = 280,
      this.height = 290,
      this.onTap,
      required this.index})
      : super(key: key);
  final Course1 data;
  final double width;
  final int index;
  final double height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              if (index != 0)
                Container(
                  width: 2,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color:  Colors.black.withOpacity(.5),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              Container(
                  margin: EdgeInsets.only(
                      top: index == 0 ? 56.h : 0,
                      bottom: index == 4 ? 71.h : 0),
                  width: 50.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    color: mixedColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                      child: Text(
                    '${index + 1}',
                    style: GoogleFonts.cairo(
                        fontSize: 25.spMin,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ))),
              if (index != 4)
                Container(
                  width: 2,
                  height: 71.h,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.5),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                ),
            ],
          ),
          Container(
            width: 260.w,
            height: height,
            margin: EdgeInsetsDirectional.only(bottom: 15.h, start: 15.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: shadowColor.withOpacity(0.15),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(0, 0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                CustomImage(
                  data.image,
                  isNetwork: true,
                  width: double.infinity,
                  height: 130.h,
                  radius: 12.r,
                ),
                Container(
                  width: width - 20.w,
                  padding: EdgeInsetsDirectional.only(top:  8.h,start:  7.w,),
                  child: Text(
                    data.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15.spMin,
                        color: textColor,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  getAttribute(IconData icon, Color color, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: labelColor, fontSize: 13),
        ),
      ],
    );
  }
}
