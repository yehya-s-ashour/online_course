import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/DummyData.dart';
import 'components/CourseCard.dart';
import 'components/homeAppBar.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            homeAppBar(),
            homeBody(),
          ],
        ),
      ),
    );
  }
}

class homeBody extends StatelessWidget {
  const homeBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ongoing Courses",
                style: TextStyle(
                    fontSize: 20.spMin,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "View All",
                  style: TextStyle(
                    fontSize: 17,
                    color: Color(0xFF463bce),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsetsDirectional.only(start: 10),
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: coursesList.length,
            itemBuilder: (context, index) => CourseCard(
              course: coursesList[index],
            ),
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
          ),
        ),
      ],
    );
  }
}
