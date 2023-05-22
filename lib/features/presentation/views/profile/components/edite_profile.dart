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
import 'package:online_course/features/presentation/views/translate.dart';

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
      return Directionality(
        textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
        child: Scaffold(
            appBar: MyAppBar(
              title:userEntity.language == 'Arabic' ? Translation.Edit_Profile1 :Translation.Edit_Profile2,
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
                           Text(userEntity.language == 'Arabic' ? Translation.Name1 :Translation.Name2,),
                          TextFieldWidget(
                            controller: name,
                            padding:
                            EdgeInsets.symmetric(vertical: 2.h, horizontal: 0),
                          ),
                           Text(userEntity.language == 'Arabic' ? Translation.E_mail1 :Translation.E_mail2,),
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
                          Text(userEntity.language == 'Arabic' ? Translation.Bio1 :Translation.Bio2,),
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
                        child:  Text(userEntity.language == 'Arabic' ? Translation.save1 :Translation.save2,)),
                  ],
                ),
              ),
            )),
      );
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
