import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/views/allCoursesRecomenedCourses/allCoursesRecomenedCoursesScreen.dart';
import 'package:online_course/features/presentation/views/contacts_chat/contacts_chat_page.dart';
import 'package:online_course/features/presentation/views/depart_screen/depart_screen.dart';
import 'package:online_course/features/presentation/views/homeScreen/homeScreen.dart';
import 'package:online_course/features/presentation/views/my_courses/myCoursesScreen.dart';
import 'package:online_course/features/presentation/views/profile/profile_screen.dart';
import 'package:online_course/features/presentation/views/review_screen/review_screen.dart';
import 'package:online_course/features/presentation/views/teacher/teacherCoursesScreen.dart';

import '../profile/components/setting_profile.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<String> listIcon = userEntity.isTeacher
      ? [
          "assets/icons/Shop_Icon.svg",
          "assets/icons/User_Icon.svg",
        ]
      : [
          "assets/icons/Shop_Icon.svg",
          "assets/icons/play_icon.svg",
          "assets/icons/Location_point.svg",
          "assets/icons/ChatbubbleIcon.svg",
          "assets/icons/User_Icon.svg",
        ];

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _body = userEntity.isTeacher
      ? [
          teacherCourses(),
          const SettingProfile(),
        ]
      : [
          homeScreen(),
          MyCoursesScreen(),
          const DepartmentScreen(),
          const ContactsChatPage(),
          const ProfileScreen(),
        ];

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Scaffold(
      body: _body[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -15),
              blurRadius: 20,
              color: const Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...List.generate(
                    listIcon.length,
                    (index) => IconButton(
                          icon: SvgPicture.asset(
                            listIcon[index],
                            height: 25.h,
                            width: 25.h,
                            color: _selectedIndex == index
                                ? kPrimaryColor
                                : inActiveIconColor,
                          ),
                          onPressed: () {
                            _selectedIndex = index;
                            setState(() {});
                          },
                        )),
              ],
            )),
      ),
    );
  }
}
