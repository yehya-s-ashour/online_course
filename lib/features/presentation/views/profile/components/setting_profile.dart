import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';
import 'package:online_course/features/presentation/views/profile/components/change_language.dart';
import 'package:online_course/features/presentation/views/profile/components/change_password.dart';
import 'package:online_course/features/presentation/views/profile/components/credentail_screen.dart';
import 'package:online_course/features/presentation/views/profile/components/edite_profile.dart';
import 'package:online_course/features/presentation/views/profile/components/faq_screen.dart';
import 'package:online_course/features/presentation/views/profile/components/notification_screen.dart';
import 'package:online_course/features/presentation/views/profile/components/support_screen.dart';
import 'package:online_course/features/presentation/views/profile/profile_screen.dart';
import 'package:online_course/features/presentation/views/splash/splash_screen.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({Key? key}) : super(key: key);

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  List<String> listItems = [
    'Edite Profile',
    'Change your password',
    'Notification Setting',
    'Change Credentials',
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
              HearderProfile(isSettingProfile: true),
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
                              onTap: () {
                                if (index == 0) {
                                  Get.to(EditProfile());
                                } else if (index == 1) {
                                  Get.to(ChangeYourPassword());
                                } else if (index == 2) {
                                  Get.to(NotificationScreen());
                                } else if (index == 3) {
                                  Get.to(ChooseCredentials());
                                } else if (index == 4) {
                                  Get.to(ChooseLanguage());
                                } else if (index == 5) {
                                  Get.to(SupportScreen());
                                } else {
                                  Get.to(FaqScreen());
                                }
                              },
                              // traiding: index == 0
                              //     ? Switch(
                              //         value: dark,
                              //         onChanged: (val) {
                              //           dark = val;
                              //           setState(() {});
                              //         },
                              //       )
                              //     : null,
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
                          child: InkWell(
                            // onTap: () {
                            //   CacheHelper.removData(key: 'uId');
                            //   navigateAndFinish(context, IntroScreen());
                            // },
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  insetPadding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),
                                  child: SizedBox(
                                    height: 125.h,
                                    width: 300.w,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15.h,
                                        horizontal: 15.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Logout',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(color: kPrimaryColor,fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                           const Text(
                                            'Are you sure, you want to logout ?',
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(color: mixedColor),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                    CacheHelper.removData(key: 'uId');
                                                    navigateAndFinish(context, IntroScreen());
                                                },
                                                child: Text(
                                                  'Logout',
                                                  style: TextStyle(color: mixedColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
    'Edite Profile',
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
              HearderProfile(isSettingProfile: true),
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
                              onTap: () {
                                if (index == 1) {
                                  Get.to(EditProfile());
                                } else if (index == 2) {
                                  Get.to(ChangeYourPassword());
                                } else if (index == 3) {
                                  Get.to(NotificationScreen());
                                } else if (index == 4) {
                                  Get.to(ChooseCredentials());
                                } else if (index == 5) {
                                  Get.to(ChooseLanguage());
                                } else if (index == 6) {
                                  Get.to(SupportScreen());
                                }
                              },
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
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                  insetPadding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 10.w),
                                  child: SizedBox(
                                    height: 125.h,
                                    width: 300.w,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 15.h,
                                        horizontal: 15.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Logout',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(color: kPrimaryColor,fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          const Text(
                                            'Are you sure, you want to logout ?',
                                          ),
                                          SizedBox(
                                            height: 8.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(color: mixedColor),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  CacheHelper.removData(key: 'uId');
                                                  navigateAndFinish(context, IntroScreen());
                                                },
                                                child: Text(
                                                  'Logout',
                                                  style: TextStyle(color: mixedColor),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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

Widget sss() => IconButton(
      onPressed: () {},
      splashRadius: 20,
      icon: const Icon(Icons.delete),
    );
