
import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:online_course/Theme/styles/colors.dart';

import 'components/profile_menu.dart';
import 'components/profile_pic.dart';
class ItemsProfileCourse{
  final String title;
  final double numOfTitle;
  final IconData iconData;

  ItemsProfileCourse({required this.title, required this.iconData,required this.numOfTitle});
  static List<ItemsProfileCourse > listItems=[
    ItemsProfileCourse(title: 'Course', numOfTitle: 15,iconData: CupertinoIcons.chart_bar_square_fill),
    ItemsProfileCourse(title: 'Review', numOfTitle: 4.9,iconData: CupertinoIcons.star_fill),
    // ItemsProfileCourse(title: 'Videos',numOfTitle: 32, iconData: CupertinoIcons.videocam_fill),
  ];
}
class ProfileScreen extends StatefulWidget {


  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
bool dark =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// appBar: MyAppBar(title: 'My Profile',),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          children: [
            const HearderProfile(bioOrEnail: "During a typical development cycle, you test an app using flutter run ",),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                children: [
SizedBox(width: 1.sw,
height: 60.h,
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    ...List.generate(ItemsProfileCourse.listItems.length, (index) => buildContainer(context,data: ItemsProfileCourse.listItems[index])),
  ],
),
),
                  const SizedBox(height: 20),
                  ...List.generate(ProfileMenuModel.listData.length, (index) =>  ProfileMenu(
                   data: ProfileMenuModel.listData[index],

                  )),


                ],
              ),
            ),
          ],
        ),
      ),

    );
  }

  Container buildContainer( BuildContext context,{required ItemsProfileCourse data}) {
    return Container(
      padding: EdgeInsets.all(4.r),
    height: 50.h,
    width: 100.w,
    decoration: BoxDecoration(
      color: kPrimaryColor,
      borderRadius: BorderRadius.circular(8.r),

    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Icon(data.iconData,color: kWhiteColor,size: 16.r,)),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(data.numOfTitle.toString(),style: Theme.of(context).textTheme.bodySmall!.copyWith(color: kWhiteColor),),
            SizedBox(width: 6.w,),
            Text(data.title,style: Theme.of(context).textTheme.bodySmall!.copyWith(color: kWhiteColor),),
          ],
        )
      ],
    ),
  );
  }


}
class HearderProfile extends StatelessWidget {
  final String? bioOrEnail;
  const HearderProfile({Key? key, this.bioOrEnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 180.h,
          width: 1.sw,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            fit: StackFit.loose,
            clipBehavior: Clip.none,
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 25.h),
                height: 150.h,
                width: 1.sw,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.r),bottomRight: Radius.circular(15.r))
                ),
                child: SizedBox(
                  width: 1.sw,
                  height: 30.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child:   InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.all(3.r),

                            decoration: const BoxDecoration(
                              color: kWhiteColor,

                              shape: BoxShape.circle,

                            ),
                            child: const Icon(Icons.arrow_back,size: 24,color: kDBackGColor,),
                          ),
                        ),
                      ),
                      Text('My Profile',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: kWhiteColor),),
                      SizedBox(width: 20.w,),
                    ],
                  ),
                ),
              ),
              const Positioned(
                  bottom: 0,


                  child: ProfilePic()),
            ],
          ),
        ),
        SizedBox(height: 15.h,),
        SizedBox(
          width: 1.sw,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const Text('Kawser Ahmed'),
              SizedBox(
                  width: 1.sw/1.3,
                  child: Text(bioOrEnail??'',textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 2,)),
            ],
          ),),
      ],
    );
  }
}
