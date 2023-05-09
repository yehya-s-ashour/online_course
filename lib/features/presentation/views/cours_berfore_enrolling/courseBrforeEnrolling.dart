import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/domain/entities/courses.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';
import 'package:online_course/features/presentation/views/cours_berfore_enrolling/components/courseBrforeEnrollingScreenAppBar.dart';

import 'components/courseDescriptionCard.dart';
import 'components/courseVideoCard.dart';
import 'components/enrollCard.dart';

class courseBrforeEnrollingScreen extends StatelessWidget {
  final Course courseModel;
  final int rate;

  const courseBrforeEnrollingScreen({super.key, required this.courseModel, required this.rate});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit,LayoutState>(builder: (context, state) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
          body: Column(
            children: [
              courseBrforeEnrollingScreenAppBar(courseModel.name),
              courseVideoCard(numberSt: courseModel.students.length,rate: rate,VideoPaht: courseModel.previewVideo),
              courseDescriptionCard(courseModel,context),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: enrollCard(courseModel: courseModel,context: context),
              ),
            ],
          ),
        ),
      );
    }, listener: (context, state) {

    },);
  }
}
