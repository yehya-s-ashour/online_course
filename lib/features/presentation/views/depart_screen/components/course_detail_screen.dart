import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/utils/data.dart';

import '../../../components/custom_image.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key, required this.course});
  final Course1 course;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            actions: [
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.help_outline_rounded,
              //     color: Colors.black,
              //   ),
              // ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.more_vert,
              //     color: Colors.black,
              //   ),
              // ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  CustomImage(
                    course.image,
                    isNetwork: true,
                    width: 1.sw,
                    fit: BoxFit.fill,
                    height: 200,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // const SizedBox(height: 8),
                  // Text(
                  //   course.description,
                  //   style: Theme.of(context).textTheme.bodyMedium,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
