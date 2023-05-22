import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/functions/navigator.dart';

class searchScreenSearchTextField extends StatelessWidget {
  const searchScreenSearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: TextFormField(
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
            size: 29.spMin,
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
          labelStyle:
              const TextStyle(color: Color.fromARGB(255, 122, 120, 120)),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide:
                BorderSide(width: 3, color: Color.fromARGB(255, 224, 223, 223)),
          ),
          fillColor: Color.fromARGB(255, 224, 223, 223),
          isDense: true,
        ),
      ),
    );
  }
}
