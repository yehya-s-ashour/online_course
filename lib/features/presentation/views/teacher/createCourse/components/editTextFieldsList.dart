import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/shared/commen.dart';
import 'package:online_course/features/presentation/components/custom_image.dart';
import 'package:online_course/features/presentation/controllers/teacher_cubit/TeacherCubit.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';

class editTextFieldsList extends StatefulWidget {
  @override
  State<editTextFieldsList> createState() => _editTextFieldsListState();
}

class _editTextFieldsListState extends State<editTextFieldsList> {
  String image = '';
  String title = '';
  String description = '';
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            selectImageFromCamera(context);
          },
          child: CustomImageFile(
            image,
            radius: 100.r,
            height: 80.h,
            width: 90.w,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "Course Title",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18.spMin,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 300.w,
              height: 50.h,
              child: TextField(
                onChanged: (value) {
                  title = value;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(
                      color: Color(0xff463bce),
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Enter Course Title",
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 15.spMin),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                        width: 3, color: Colors.black.withOpacity(0.05)),
                  ),
                  fillColor: Colors.black.withOpacity(0.1),
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                SizedBox(
                  width: 30.w,
                ),
                Text(
                  "Description",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 18.spMin,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 300.w,
              child: TextField(
                onChanged: (value) {
                  description = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsetsDirectional.only(top: 90),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    borderSide: BorderSide(
                      color: Color(0xff463bce),
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 15.spMin),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                        width: 3, color: Colors.black.withOpacity(0.05)),
                  ),
                  fillColor: Colors.black.withOpacity(0.1),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 20.0),
                  child: Text(
                    "Category:",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(foregroundColor: kWhiteColor),
                onPressed: () {
                  if (description != '' && image != '' && description != '') {
                    TeacherCubit.get(context)
                        .createCourse(
                            image: File(image),
                            collection: dropdownValue,
                            description: description,
                            title: title)
                        .then((value) => Get.to(MainHomeScreen()));
                  }
                },
                child: Text(
                  userEntity.language != 'Arabic' ? 'Create' : 'انشاء',
                )),
          ],
        ),
      ],
    );
  }

  void selectImageFromCamera(BuildContext context) async {
    File? image = await pickImageFromGallery(context);
    if (image != null) {
      this.image = image.path;
      print('aaaaaaaaaaaaaaaa${this.image}');
      setState(() {});
    }
  }
}

const List<String> list = <String>[
  'Business',
  'Development',
  'Marketing',
  'Personal Development',
  'Teaching & Academics'
];
