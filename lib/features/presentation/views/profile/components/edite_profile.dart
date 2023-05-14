import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/generated/assets.dart';
import 'package:online_course/features/presentation/components/custom_textfeild.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutCubit.dart';
import 'package:online_course/features/presentation/controllers/LayoutCubit/LayoutState.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? imageFile;
  final picker = ImagePicker();
  var email = TextEditingController();

  var bio = TextEditingController();
  var name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    email.text = userEntity.email;
    name.text = userEntity.name;
    bio.text = userEntity.bio;
    return BlocConsumer<LayoutCubit,LayoutState>(builder: (context, state) {
      return Scaffold(
          appBar: MyAppBar(
            title: "Edite Profile",
            backgroundColor: kPrimaryColor,
            color: Colors.white,
            titleColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundColor: kPrimaryColor,
                      foregroundColor: kWhiteColor,
                      radius: 55.r,
                      child: Image.asset(Assets.imagesProfileImage)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    userEntity.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Name'),
                        TextFieldWidget(
                          controller: name,
                          padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 0),
                        ),
                        const Text('E-mail'),
                        TextFieldWidget(
                          controller: email,
                          padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 0),
                        ),
                        // const Text('Phone'),
                        // TextFieldWidget(
                        //   padding:
                        //       EdgeInsets.symmetric(vertical: 2.h, horizontal: 0),
                        // ),
                        const Text('Bio'),
                        Container(
                          child: TextFieldWidget(
                            controller: bio,
                            maxLength: 250,
                            maxLine: 5,
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: kWhiteColor,
                        minimumSize: Size(150.w, 45.h),
                      ),
                      onPressed: () {
                        LayoutCubit.get(context).setNewUserEntity(name: name.text, email: email.text, bio: bio.text);
                      },
                      child: const Text('save')),
                ],
              ),
            ),
          ));
    }, listener: (context, state) {

    },);
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => imageFile = File(pickedFile.path));
    }
  }
}
