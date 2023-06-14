import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/utils/data.dart';
import 'package:online_course/features/data/models/roadmap_model.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/depart_screen/components/course_screen.dart';
import 'package:online_course/features/presentation/views/depart_screen/depart_screen.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({Key? key}) : super(key: key);

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
        // appBar: MyAppBar(title: "Language"),
        appBar: MyAppBar(
          title: userEntity.language == 'Arabic' ? Translation.Achievements2 :Translation.Achievements1,
          backgroundColor: kPrimaryColor,
          color: Colors.white,
          titleColor: Colors.white,
        ),
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: buildColumn(
              roadmapModel: LayoutCubit.get(context).roadmap.values.toList(),
              roadmapName: LayoutCubit.get(context).roadmap.keys.toList()),
        ),
      ),
    );
  }

  Widget buildColumn(
      {required List<RoadmapModel> roadmapModel,
      required List<String> roadmapName}) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: 15.w, right: 15.w),
      child: ListView(
        children: [
          ...List.generate(
              roadmapModel.length,
              (index) => FeatureItem(
                    image: roadmapModel[index].image1,
                    name: roadmapName[index],
                    width: 1.sw,
                    height: 170,
                    onTap: () {
                      Get.to(() => CoursesScreen(index: index));
                    },
                  )),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
