import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
          size: 26.spMin,
        ),
        suffixIcon: Icon(
          Icons.mic,
          color: Color(0xff463bce),
          size: 26.spMin,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "Search in courses",
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        isDense: true,
      ),
    );
  }
}
