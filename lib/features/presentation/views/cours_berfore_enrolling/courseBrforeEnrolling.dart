import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course/features/presentation/views/cours_berfore_enrolling/components/courseBrforeEnrollingScreenAppBar.dart';

import 'components/courseDescriptionCard.dart';
import 'components/courseVideoCard.dart';
import 'components/enrollCard.dart';

class courseBrforeEnrollingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            courseBrforeEnrollingScreenAppBar(),
            courseVideoCard(),
            courseDescriptionCard(),
            enrollCard(),
          ],
        ),
      ),
    );
  }
}
