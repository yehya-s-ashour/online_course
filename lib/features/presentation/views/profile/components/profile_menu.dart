import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/views/profile/components/setting_profile.dart';

class ProfileMenuModel {
  final String text, icon;
  final Function() ontap;

  ProfileMenuModel(
      {required this.text, required this.icon, required this.ontap});
  static List<ProfileMenuModel> listData = [
    // ProfileMenuModel(text: "Dark Mode", icon: "assets/icons/moon_solid.svg", ontap: (){}),
    ProfileMenuModel(
        text: "Setting",
        icon: "assets/icons/gear_solid.svg",
        ontap: () {
          Get.to(() => const SettingProfile());
        }),
    // ProfileMenuModel(text: "Payment Details", icon: "assets/icons/credit_card_solid.svg", ontap: (){}),
    ProfileMenuModel(
        text: "Achievement",
        icon: "assets/icons/award_solid.svg",
        ontap: () {}),
    ProfileMenuModel(
        text: "Wishlist", icon: "assets/icons/heart_solid.svg", ontap: () {}),
  ];
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    this.traiding,
    required this.data,
  }) : super(key: key);

  final ProfileMenuModel data;
  final Widget? traiding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
      child: SizedBox(
        height: 50,
        child: InkWell(
          onTap: data.ontap,
          child: Card(
            color: const Color(0xFFF5F6F9),
            margin: EdgeInsets.zero,
            child: Row(
              children: [
                Card(
                  color: kPrimaryColor,
                  child: Padding(
                    padding: EdgeInsets.all(7.0.r),
                    child: SvgPicture.asset(
                      data.icon,
                      color: kWhiteColor,
                      width: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: Text(
                  data.text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 15.r),
                )),
                traiding ??
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18.r,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
