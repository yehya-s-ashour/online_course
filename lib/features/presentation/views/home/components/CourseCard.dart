import 'package:flutter/material.dart';
import 'package:online_course/features/data/models/Course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 280,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xff5d54dd),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(course.image), fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  course.name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(course.name),
            Text(
              "${course.numberOfLessons.toString()} courses",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
