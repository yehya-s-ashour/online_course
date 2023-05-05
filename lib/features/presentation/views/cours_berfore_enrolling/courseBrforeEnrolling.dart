import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/views/cours_berfore_enrolling/components/courseBrforeEnrollingScreenAppBar.dart';

import 'components/courseDescriptionCard.dart';
import 'components/courseVideoCard.dart';
import 'components/enrollCard.dart';

class courseBrforeEnrollingScreen extends StatelessWidget {
  final CourseModel courseModel;
  final int rate;

  const courseBrforeEnrollingScreen({super.key, required this.courseModel, required this.rate});
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            courseBrforeEnrollingScreenAppBar(),
            courseVideoCard(numberSt: courseModel.students.length,rate: rate,VideoPaht: courseModel.previewVideo),
            courseDescriptionCard(courseModel.description),
            enrollCard(),
          ],
        ),
      ),
    );
  }
}
