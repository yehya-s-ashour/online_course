import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/presentation/views/homeScreen/components/starsRating.dart';

class allCoursesRecomenedCoursesScreenCourseCard extends StatelessWidget {
  final Category category;
  const allCoursesRecomenedCoursesScreenCourseCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.2),
            blurRadius: 4.0.r,
            spreadRadius: .05.r,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 100.h,
            width: 200.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                    image: AssetImage(category.thumbnail), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 7.w,
              ),
              Text(
                category.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 15.5.spMin,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                width: 7.w,
              ),
              starsRating(),
            ],
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              Text(
                "64 Lessons",
                style: TextStyle(
                    fontSize: 9.spMin,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 153, 151, 151)),
              ),
              SizedBox(
                width: 50.w,
              ),
              Text(
                "+40 Exercise",
                style: TextStyle(
                    fontSize: 9.spMin,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 153, 151, 151)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
