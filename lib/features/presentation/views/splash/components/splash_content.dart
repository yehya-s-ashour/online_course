import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Theme/styles/colors.dart';




class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image, this.title,
  }) : super(key: key);
  final String? text, image,title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        const Spacer(flex: 2),
        Image.asset(
          image!,
          height: 255.h,
          width: 235.w,
        ),
        const Spacer(),
         Text(
         title??"",
          style: const TextStyle(
            fontSize: 30,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.h,),
        Text(
          text!,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 20.h,),
      ],
    );
  }
}
