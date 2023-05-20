import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/extensions/time_extension.dart';

class ShowFullScreenImage extends StatelessWidget {
  ShowFullScreenImage(
      {Key? key, required this.name, required this.image, this.timeSent})
      : super(key: key);

  final String name;
  final String image;
  int? timeSent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: TextStyle(fontSize: 14.spMin)),
            if (timeSent != null)
              Text(
                  '${DateTime.fromMillisecondsSinceEpoch(timeSent!).chatContactTime}',
                  style: TextStyle(fontSize: 14.spMin)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 670.h,
                child: CachedNetworkImage(imageUrl: image, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
