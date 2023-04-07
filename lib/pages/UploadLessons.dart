import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:online_course/models/LessonModel.dart';
import 'package:uuid/uuid.dart';

class UploadLessons extends StatefulWidget {
  const UploadLessons({super.key});

  @override
  State<UploadLessons> createState() => _UploadLessonsState();
}

class _UploadLessonsState extends State<UploadLessons> {
  @override
  Widget build(BuildContext context) {
    var imageController = TextEditingController();
    var videoController = TextEditingController();
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
              "Upload Lesson",
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
              controller: videoController,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelText: "Video",
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
              controller: teacherIdController,
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
            IconButton(
              iconSize: 100,
              icon: const Icon(Icons.upload),
              onPressed: () {
                String lessonId = const Uuid().v1();
                LessonModel lessonModel = LessonModel(
                    image: imageController.text,
                    video: videoController.text,
                    name: nameController.text,
                    description: descriptionController.text,
                    creationDate: DateTime.now(),
                    courseId: 'a2993ba0-d573-11ed-8f5c-5ffc43a751f6',
                    mainCategory: 'Development',
                    subCategory: 'Web Development',
                    teacherName: teacherNameController.text,
                    teacherId: teacherIdController.text,
                    students: [],
                    lessonId: lessonId);

                FirebaseFirestore.instance
                    .collection('Categories')
                    .doc('1')
                    .collection('Development')
                    .doc('1')
                    .collection('Web Development')
                    .doc('a2993ba0-d573-11ed-8f5c-5ffc43a751f6')
                    .collection('Lessons')
                    .doc(lessonId)
                    .set(lessonModel.toMap())
                    .then((value) {
                  imageController.text = '';
                  videoController.text = '';
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
