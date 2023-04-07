import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_course/models/CourseModel.dart';
import 'package:uuid/uuid.dart';

class UploadCourse extends StatefulWidget {
  const UploadCourse({super.key});

  @override
  State<UploadCourse> createState() => _UploadCourseState();
}

class _UploadCourseState extends State<UploadCourse> {
  @override
  Widget build(BuildContext context) {
    var imageController = TextEditingController();
    var previewVideoController = TextEditingController();
    var nameController = TextEditingController();
    var descriptionController = TextEditingController();
    var teacherNameController = TextEditingController();
    var teacherIdController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 150),
            Text(
              "Upload Course",
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Name",
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                isDense: true,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: imageController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "image",
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                isDense: true,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: previewVideoController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Preview Video",
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                isDense: true,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Description",
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                isDense: true,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: teacherNameController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Teacher name",
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                isDense: true,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: teacherIdController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Teacher id",
                labelStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                isDense: true,
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              iconSize: 100,
              icon: const Icon(Icons.upload),
              onPressed: () {
                String courseId = const Uuid().v1();
                CourseModel courseModel = CourseModel(
                    image: imageController.text,
                    previewVideo: previewVideoController.text,
                    name: nameController.text,
                    description: descriptionController.text,
                    numberOfLessons: 0,
                    rate: [],
                    creationDate: DateTime.now(),
                    courseId: courseId,
                    mainCategory: 'Development',
                    subCategory: 'Web Development',
                    teacherName: teacherNameController.text,
                    teacherId: teacherIdController.text,
                    lastLesson: '',
                    students: []);
                FirebaseFirestore.instance
                    .collection('Categories')
                    .doc('1')
                    .collection('Development')
                    .doc('1')
                    .collection('Web Development')
                    .doc(courseId)
                    .set(courseModel.toMap())
                    .then((value) {
                  imageController.text = '';
                  previewVideoController.text = '';
                  nameController.text = '';
                  descriptionController.text = '';
                  teacherNameController.text = '';
                  teacherIdController.text = '';
                  setState(() {});
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
