import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:video_player/video_player.dart';

class courseVideoCard extends StatefulWidget {
  @override
  State<courseVideoCard> createState() => _courseVideoCardState();
}

class _courseVideoCardState extends State<courseVideoCard> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();

    videoPlayerController =
        VideoPlayerController.asset("assets/images/video.mp4")
          ..addListener(() => setState(() {}))
          ..setLooping(true)
          ..initialize().then((_) => videoPlayerController.play());
  }

  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 310.w,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4.0.r,
            spreadRadius: .05.r,
            offset: Offset(0, 4.0.r),
          ),
        ],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Container(
            height: 180.h,
            width: 310.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                    image: AssetImage("assets/images/image.jpg"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                width: 75.w,
                height: 30.h,
                margin: EdgeInsetsDirectional.only(start: 20.w),
                padding: EdgeInsetsDirectional.only(
                    start: 7.w, top: 8.w, bottom: 5.w, end: 5.w),
                decoration: BoxDecoration(
                    color: mixedColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Text(
                  "Top Rated",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.5.spMin,
                  ),
                ),
              ),
              SizedBox(
                width: 25.w,
              ),
              Icon(Icons.people_alt_outlined,
                  color: Colors.black.withOpacity(0.7)),
              Text(
                "5K",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 13.spMin,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Icon(Icons.star,
                  color: Colors.black.withOpacity(0.7), size: 20.spMin),
              Text(
                "4.0",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  fontSize: 13.spMin,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
