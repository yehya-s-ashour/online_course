import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/utils/data.dart';
import 'package:online_course/features/data/models/roadmap_model.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/depart_screen/components/course_detail_screen.dart';
import '../../../components/custom_image.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({Key? key, required this.index}) : super(key: key);
  final int index;
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
            actions: [],
            title: Text(
              LayoutCubit.get(context).roadmap.keys.toList()[index],
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: kDBackGColor),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) => buildColumn(roadmapModel: LayoutCubit.get(context).roadmap.values.toList()[this.index]),
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Widget buildColumn({required RoadmapModel roadmapModel}) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h, left: 15.w, right: 15.w),
      child: Column(
        children: [
          ...List.generate(
              5,
                  (index) {
                if(index==0){
                  return CoursesItem(
                    data: Course1(name: roadmapModel.name1, image: roadmapModel.image1,),
                    width: 1.sw,
                    height: 170,
                    onTap: () {
                      Get.to(() => CourseDetailScreen(
                          image: roadmapModel.image1,name: roadmapModel.name1,description: roadmapModel.description1,));
                    },
                  );
                }
                else if(index==1){
                  return CoursesItem(
                    data: Course1(name: roadmapModel.name2, image: roadmapModel.image2,),
                    width: 1.sw,
                    height: 170,
                    onTap: () {
                      Get.to(() => CourseDetailScreen(
                          image: roadmapModel.image2,name: roadmapModel.name2,description: roadmapModel.description2));
                    },
                  );
                }
                else if(index==2){
                  return CoursesItem(
                    data: Course1(name: roadmapModel.name3, image: roadmapModel.image3,),
                    width: 1.sw,
                    height: 170,
                    onTap: () {
                      Get.to(() => CourseDetailScreen(
                          image: roadmapModel.image3,name: roadmapModel.name3,description: roadmapModel.description3));
                    },
                  );
                }
                else if(index==3){
                  return CoursesItem(
                    data: Course1(name: roadmapModel.name4, image: roadmapModel.image4,),
                    width: 1.sw,
                    height: 170,
                    onTap: () {
                      Get.to(() => CourseDetailScreen(
                          image: roadmapModel.image4,name: roadmapModel.name4,description: roadmapModel.description4));
                    },
                  );
                }
                else{
                  return CoursesItem(
                    data: Course1(name: roadmapModel.name5, image: roadmapModel.image5,),
                    width: 1.sw,
                    height: 170,
                    onTap: () {
                      Get.to(() => CourseDetailScreen(
                          image: roadmapModel.image5,name: roadmapModel.name5,description: roadmapModel.description5));
                    },
                  );
                }
                  }),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
class CoursesItem extends StatelessWidget {
  CoursesItem(
      {Key? key,
        required this.data,
        this.width = 280,
        this.height = 290,
        this.onTap})
      : super(key: key);
  final Course1 data;
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
              data.image,
              isNetwork: true,
              width: double.infinity,
              height: 130,
              radius: 12,
            ),
            Container(
              width: width - 20,
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Text(
                data.name,
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