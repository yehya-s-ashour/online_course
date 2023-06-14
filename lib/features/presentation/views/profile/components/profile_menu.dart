import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/views/profile/components/achievement_screen.dart';
import 'package:online_course/features/presentation/views/profile/components/setting_profile.dart';
import 'package:online_course/features/presentation/views/profile/components/wish_list_screen.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class ProfileMenuModel {
  final String text, icon;
  final Function() ontap;

  ProfileMenuModel(
      {required this.text, required this.icon, required this.ontap});

  static List<ProfileMenuModel> listData = [
    ProfileMenuModel(
        text: userEntity.language != 'Arabic' ? "Setting" : 'الأعدادات',
        icon: "assets/icons/gear_solid.svg",
        ontap: () {
          Get.to(() => const SettingProfile());
        }),
    ProfileMenuModel(
        text: userEntity.language != 'Arabic' ? Translation.Achievements1 :Translation.Achievements2,
        icon: "assets/icons/award_solid.svg",
        ontap: () {
          Get.to(() => const AchievementScreen());
        }),
    ProfileMenuModel(
      text:userEntity.language != 'Arabic' ? Translation.Wishlists1 :Translation.Wishlists2,
      icon: "assets/icons/heart_solid.svg",
      ontap: () {
        Get.to(() => const WishListScreen());
      },
    ),
  ];
}

class ProfileMenu extends StatelessWidget {
  ProfileMenu({
    required this.isNotDark,
    required this.data,
  });

  final ProfileMenuModel data;
  final bool isNotDark;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: InkWell(
        onTap: data.ontap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              //set border radius more than 50% of height and width to make circle
            ),
            color: Color(0xFF463bce),
            child: SizedBox(
              height: 50.h,
              child: Row(
                children: [
                  Card(
                    color: kPrimaryColor,
                    child: Padding(
                      padding: EdgeInsets.all(7.0.r),
                      child: SvgPicture.asset(
                        data.icon,
                        color: kWhiteColor,
                        width: 22.w,
                      ),
                    ),
                  ),
                   SizedBox(width: 20.w),
                  SizedBox(
                    width: 130.w,
                    child: Text(data.text,
                        style: GoogleFonts.cairo(color: Colors.white)),
                  ),
                  Spacer(),
                  isNotDark
                      ? SizedBox(
                        height: 50.w,
                        child: Row(

                          children: [
                            SizedBox(width: 10.w,),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 18.r,
                              color: Colors.white,
                            ),
                            SizedBox(width: 7.w,),
                          ],
                        ),
                      )
                      : Switch(
                          activeColor: Colors.white54,
                          inactiveTrackColor: Colors.blueAccent,
                          value: true,
                          onChanged: (val) {},
                        ),
                  if (isNotDark)
                    SizedBox(
                      width: 10.w,
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
