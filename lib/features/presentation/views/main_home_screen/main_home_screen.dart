import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/views/contacts_chat/contacts_chat_page.dart';
import 'package:online_course/features/presentation/views/homeScreen/homeScreen.dart';
import 'package:online_course/features/presentation/views/privew_screen/priviews_screen.dart';
import 'package:online_course/features/presentation/views/profile/components/setting_profile.dart';
import 'package:online_course/features/presentation/views/profile/profile_screen.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  final List<String> listIcon = [
    "assets/icons/Shop_Icon.svg",
    "assets/icons/play_icon.svg",
    "assets/icons/ChatbubbleIcon.svg",
    "assets/icons/User_Icon.svg",
  ];

  final List<Widget> _body = [
    homeScreen(),
    const PrviewsScreen(),
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
