import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/views/serachScreen/searchScreen.dart';

class homeScreenSearchTextField extends StatelessWidget {
  const homeScreenSearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: TextFormField(
        onTap: () {
          Get.to(searchScreen());
        },
        showCursor: true,
        readOnly: true,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: Color(0xff463bce),
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 26.spMin,
          ),
          suffixIcon: Container(
            decoration: BoxDecoration(
              color: Color(0xff463bce),
              border: Border.all(
                  color: Color.fromARGB(255, 236, 234, 234), width: 4.0.w),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Icon(
              Icons.mic,
              color: Colors.white,
              size: 28.spMin,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: userEntity.language == 'Arabic'
              ? "البحث في الكورسات"
              : "Search in courses",
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Color.fromARGB(255, 242, 240, 240),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          isDense: true,
        ),
      ),
    );
  }
}
