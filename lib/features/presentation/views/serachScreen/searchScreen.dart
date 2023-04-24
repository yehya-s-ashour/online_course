import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/presentation/views/serachScreen/components/recentSearchListView.dart';

import 'components/searchScreenAppBar.dart';
import 'components/searchScreenSearchTextField.dart';

class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              searchScreenAppBar(),
              SizedBox(
                  width: 320.w, child: const searchScreenSearchTextField()),
              recentSearchListView()
            ],
          ),
        ),
      ),
    );
  }
}
