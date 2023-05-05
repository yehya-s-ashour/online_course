import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/data/models/DummyData.dart';
import 'package:online_course/features/presentation/views/homeScreen/components/starsRating.dart';

class recentSearchCard extends StatelessWidget {
  final RecentSearch recentSearch;
  const recentSearchCard({
    Key? key,
    required this.recentSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 8.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4.0.r,
              spreadRadius: .05.r,
              offset: Offset(0, 4.0.r),
            ),
          ],
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 6.w,
                ),
                Container(
                  height: 53.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      image: DecorationImage(
                          image: AssetImage(recentSearch.image),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 12.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7.w,
                    ),
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        recentSearch.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17.spMin,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          " 64 Lessons",
                          style: TextStyle(
                              fontSize: 11.spMin,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 153, 151, 151)),
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
                              color: Color.fromARGB(255, 196, 193, 193)),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "+40 Exercise",
                          style: TextStyle(
                              fontSize: 11.spMin,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 153, 151, 151)),
                        ),
                      ],
                    ),
                    starsRating(rating: 3,)
                  ],
                ),
              ],
            ),
            Spacer(),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color.fromARGB(255, 87, 87, 87),
                  size: 17.spMax,
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
