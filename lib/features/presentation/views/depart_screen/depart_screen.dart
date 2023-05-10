import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/data/models/roadmap_model.dart';
import 'package:online_course/features/presentation/components/custom_image.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/depart_screen/components/course_screen.dart';

class DepartmentScreen extends StatelessWidget {
  const DepartmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kWhiteColor,
            pinned: true,
            snap: true,
            floating: true,
            centerTitle: true,
            title: Text(
              'RoadMaps',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kDBackGColor),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildColumn(roadmapModel: LayoutCubit.get(context).roadmap.values.toList(),roadmapName: LayoutCubit.get(context).roadmap.keys.toList()),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget buildColumn({required List<RoadmapModel> roadmapModel,required List<String> roadmapName}) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: 15.w, right: 15.w),
      child: Column(
        children: [
          ...List.generate(
              roadmapModel.length,
              (index) => FeatureItem(
                    image: roadmapModel[index].image1,
                  name: roadmapName[index],
                    width: 1.sw,
                    height: 170,
                    onTap: () {
                      print(index);
                      Get.to(() => CoursesScreen(
                          index: index));
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

class FeatureItem extends StatelessWidget {
  FeatureItem(
      {Key? key,
      required this.name,
      required this.image,
      this.width = 280,
      this.height = 290,
      this.onTap})
      : super(key: key);
  final String name;
  final String image;
  final double width;
  final double height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.only(bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            CustomImage(
              image,
              isNetwork: true,
              width: double.infinity,
              height: 130,
              radius: 12,
            ),
            Container(
              width: width - 20,
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 17,
                    color: textColor,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  getAttribute(IconData icon, Color color, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: labelColor, fontSize: 13),
        ),
      ],
    );
  }
}
