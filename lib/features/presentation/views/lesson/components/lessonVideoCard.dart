import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:video_player/video_player.dart';

class lessonVideoCard extends StatefulWidget {
  @override
  State<lessonVideoCard> createState() => _lessonVideoCard();
}

class _lessonVideoCard extends State<lessonVideoCard> {
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
        ],
      ),
    );
  }
}
