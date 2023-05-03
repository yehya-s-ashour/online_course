import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';

Widget courseDescriptionCard() {
  return Container(
    padding: EdgeInsetsDirectional.only(start: 20.w),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Text(
          "Description",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 24.spMin,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        SizedBox(height: 5.h,),
        Row(
          children: [
            // SizedBox(
            //   width: 10.w,
            // ),
            Expanded(
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                // textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16.spMin,
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.6)),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(width: 7.w,),
            Container(
              width: 55.0,
              height: 55.0,
              decoration: BoxDecoration(
                color: mixedColor,
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    blurRadius: 7.0,
                    spreadRadius: 1.5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.white,
                  size: 36.0,
                ),
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "63 Lessons",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20.spMin,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "64 Video",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.spMin,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '٠',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 12.spMin,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "27 Quiz",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.spMin,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        '٠',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12.spMin,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "27 Quiz",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10.spMin,
                            color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}
