import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/presentation/views/serachScreen/components/recentSearchCard.dart';

class recentSearchListView extends StatelessWidget {
  const recentSearchListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 20.w,
            ),
            Text(
              "Recent Search",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22.spMin,
                  color: Colors.black),
            ),
          ],
        ),
        Container(
            margin:
                EdgeInsetsDirectional.only(start: 25.w, end: 25.w, top: 10.h),
            height: 500.h,
            width: 330.w,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.separated(
                itemCount: searchList.length,
                itemBuilder: (context, index) => recentSearchCard(
                  recentSearch: searchList[index],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
              ),
            )),
      ],
    );
  }
}
