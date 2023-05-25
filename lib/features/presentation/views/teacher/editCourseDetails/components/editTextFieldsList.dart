import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/shared/commen.dart';
import 'package:online_course/features/data/models/courses_model.dart';
import 'package:online_course/features/presentation/components/custom_image.dart';
import 'package:online_course/features/presentation/controllers/teacher_cubit/TeacherCubit.dart';

class editTextFieldsList extends StatefulWidget {
  final CoursesModel course;

  const editTextFieldsList({super.key, required this.course});

  @override
  State<editTextFieldsList> createState() => _editTextFieldsListState();
}

class _editTextFieldsListState extends State<editTextFieldsList> {
  var description = TextEditingController();
  var title = TextEditingController();
  String image='';
  @override
  Widget build(BuildContext context) {
    description.text=widget.course.description;
    title.text=widget.course.name;
    return Column(children: [
      Column(
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
                  controller: title,
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
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 15.spMin),
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
                  controller: description,
                  maxLines: 5,
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
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 15.spMin),
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
                height: 15.h,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(foregroundColor: kWhiteColor),
                  onPressed: () {
                      TeacherCubit.get(context)
                          .editCourse(
                          title: title.text,description: description.text,image:widget.course.image,subCategory: widget.course.subCategory,mainCategory: widget.course.mainCategory,courseId: widget.course.courseId,newImage:image )
                          .then((value) => print('aaaaaaaaaaaaaaaaa'));

                  },
                  child: Text(
                    userEntity.language != 'Arabic' ? 'Edit' : 'تعديل',
                  )),
            ],
          ),
        ],
      ),
    ]);
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
