import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/courseEnroll_model.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';

import 'components/homeAppBar.dart';
import 'components/onGoingCourse/onGoingCourses.dart';
import 'components/recommendedCourses.dart';

class homeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('AaAAAAAAAAAAAAAAAAA');
    return StreamBuilder<List<CourseEnrollModel>>(
      stream: LayoutCubit.get(context).getCoursesEnroll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: mixedColor,
            ),
          );
        }
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  homeAppBar(context),
                  if(snapshot.data!=null&&snapshot.data!.length>0)
                    onGoingCourses(courseEnrollModel: snapshot.data!,),
                  recommendedCourses(),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
