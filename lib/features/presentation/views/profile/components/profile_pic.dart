import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:online_course/core/Theme/styles/colors.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.w,
      width: 80.w,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        // fit: StackFit.passthrough,
        clipBehavior: Clip.none,
        children: [
          DashedCircle(
            color: kWhiteColor,
            child: SizedBox(
              height: 80.w,
              width: 80.w,
              child: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/Profile_Image.png"),
              ),
            ),
          ),
          Positioned(
            right: 25.w,
            left: 25.w,
            bottom: -10,
            child: SizedBox(
              height: 30.w,
              width: 30.w,
              child: Card(
                  margin: EdgeInsets.zero,
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/icons/CameraIcon.svg",
                      height: 20.w,
                      width: 20.w,
                      color: kWhiteColor,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
