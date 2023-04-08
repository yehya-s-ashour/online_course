import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/presentation/views/serachScreen/components/recentSearchCard.dart';

import 'notificationCard.dart';

class notificationsSearchListView extends StatelessWidget {
  const notificationsSearchListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                EdgeInsetsDirectional.only(start: 25.w, end: 25.w, top: 10.h),
            height: 600.h,
            width: 330.w,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: notificationList.length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.spMin,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              notificationCard(
                                notification: notificationList[index],
                              ),
                            ],
                          );
                        } else if (index == 3) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.h,
                              ),
                              Text(
                                "Earlier",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 22.spMin,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              notificationCard(
                                notification: notificationList[index],
                              ),
                            ],
                          );
                        } else {
                          return notificationCard(
                            notification: notificationList[index],
                          );
                        }
                      },
                      separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]);
  }
}
