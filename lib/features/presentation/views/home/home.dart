import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/DummyData.dart';
import 'components/onGoingCourseCard.dart';
import 'components/homeAppBar.dart';
import 'components/onGoingCourses.dart';
import 'components/recommendedCourses.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [homeAppBar(), onGoingCourses(), recommendedCourses()],
        ),
      ),
    );
  }
}
