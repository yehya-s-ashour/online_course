import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/views/profile/profile_screen.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({Key? key}) : super(key: key);

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  List<String> listItems = [
    'Dark Mode',
    'Edite Name',
    'Change your password',
    'Notification Setting',
    'Change Credtails',
    'Change Language',
    'Support',
    'FAQ',
  ];
  bool dark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HearderProfile(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    ...List.generate(
                        listItems.length,
                        (index) => ItemsSetting(
                              text: listItems[index],
                              onTap: () {},
                              traiding: index == 0
                                  ? Switch(
                                      value: dark,
                                      onChanged: (val) {
                                        dark = val;
                                        setState(() {});
                                      },
                                    )
                                  : null,
                            )),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      width: 1.sw / 3,
                      height: 50.h,
                      child: Card(
                        color: kWhiteColor,
                        child: Padding(
                          padding: EdgeInsets.all(6.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.logout,
                                color: kPrimaryColor,
                              ),
                              Text(
                                'Logout',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: kPrimaryColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingProfileTeach extends StatefulWidget {
  const SettingProfileTeach({Key? key}) : super(key: key);

  @override
  State<SettingProfileTeach> createState() => _SettingProfileTeachState();
}

class _SettingProfileTeachState extends State<SettingProfileTeach> {
  List<String> listItems = [
    'Dark Mode',
    'Edite Name',
    'Change your password',
    'Notification Setting',
    'Change Credtails',
    'Change Language',
    'Support',
  ];
  bool dark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HearderProfile(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    ...List.generate(
                        listItems.length,
                        (index) => ItemsSetting(
                              text: listItems[index],
                              onTap: () {},
                              traiding: index == 0
                                  ? Switch(
                                      value: dark,
                                      onChanged: (val) {
                                        dark = val;
                                        setState(() {});
                                      },
                                    )
                                  : null,
                            )),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      width: 1.sw / 3,
                      height: 50.h,
                      child: Card(
                        color: kWhiteColor,
                        child: Padding(
                          padding: EdgeInsets.all(6.0.r),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.logout,
                                color: kPrimaryColor,
                              ),
                              Text(
                                'Logout',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: kPrimaryColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemsSetting extends StatelessWidget {
  const ItemsSetting({
    Key? key,
    this.traiding,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final Function() onTap;
  final Widget? traiding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 4.h),
      child: SizedBox(
        height: 50,
        child: InkWell(
          onTap: onTap,
          child: Card(
            color: const Color(0xFFF5F6F9),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 14.r),
                  ),
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
      ),
    );
  }
}
