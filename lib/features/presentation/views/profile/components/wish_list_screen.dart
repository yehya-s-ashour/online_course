import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/utils/data.dart';
import 'package:online_course/features/data/models/roadmap_model.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/depart_screen/components/course_screen.dart';
import 'package:online_course/features/presentation/views/depart_screen/depart_screen.dart';
import 'package:online_course/features/presentation/views/homeScreen/components/courseCard.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: MyAppBar(
          title: userEntity.language != 'Arabic'
              ? Translation.Wishlists1
              : Translation.Wishlists2,
          backgroundColor: kPrimaryColor,
          color: Colors.white,
          titleColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: isLike ?Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(end: 150.w),
                child: CourseCardd(courseModel: LayoutCubit.get(context).businessCourses[0]),
              ),
            ],
          ):Center(
            child: SizedBox(
              width: 250,
              child: Text(
                userEntity.language == 'Arabic'
                    ? "ليس لديك أي كورسات مفضلة بعد"
                    : "You Don't Have Any Favourite Courses Yet",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: GoogleFonts.cairo(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: mixedColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
