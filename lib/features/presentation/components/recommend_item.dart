
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/utils/data.dart';

import '../Theme/styles/colors.dart';
import 'custom_image.dart';


class RecommendItem extends StatelessWidget {
  RecommendItem({ Key? key, required this.data, this.onTap}) : super(key: key);
  final Course1 data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(10),
          width:1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              CustomImage(data.image,
              isNetwork: false,
                radius: 15,
                height: 80,
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Text(data.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              )
            ],
          )
        ),
    );
  }
}