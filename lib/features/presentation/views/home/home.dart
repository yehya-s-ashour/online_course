import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/Course.dart';
import 'components/CourseCard.dart';
import 'components/SearchTextField.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: const [
            AppBar(),
            Body(),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
            itemCount: CoursesList.length,
            itemBuilder: (context, index) => CourseCard(
              course: CoursesList[index],
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

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 235,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            Color(0xFF463bce),
            Color(0xff5d54dd),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Hey User,",
                    style: TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    " Let's Start Learning",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ],
              ),
              IconButton(
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 35,
                  ),
                  onPressed: () {}),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            height: 30,
          ),
          SearchTextField(),
        ],
      ),
    );
  }
}
