import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/chat/components/image/show_image.dart';
import '/core/extensions/extensions.dart';
import '../../../core/functions/navigator.dart';
import '../../../core/shared/commen.dart';

Future<void> showUpdateProfilePicModelBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile photo',
              style: context.titleLarge,
            ),
            Row(
              children: [
                PickProfileImage(
                  onTap: () {
                    selectImageFromCamera(context);
                  },
                  icon: Icons.photo_camera,
                  name:'Camera',
                ),
                const SizedBox(width: 40),
                PickProfileImage(
                  onTap: () {
                    Get.to(Images(index: 2,));
                  },
                  icon: Icons.photo,
                  name: 'Gallery',
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
Future<void> showUpdateGroupPicModelBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile photo',
              style: context.titleLarge,
            ),
            Row(
              children: [
                PickProfileImage(
                  onTap: () {
                    selectImageFromCamera(context);
                  },
                  icon: Icons.photo_camera,
                  name: 'Camera',
                ),
                const SizedBox(width: 40),
                PickProfileImage(
                  onTap: () {
                    Get.to(Images(index: 5,));
                  },
                  icon: Icons.photo,
                  name: 'Gallery',
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}

void selectImageFromCamera(BuildContext context) async {
  File? image = await pickImageFromCamera(context);
  if(image != null){
    cropImage(image.path).then((value) {
      if(value != null) {
        // AuthCubit.get(context).updateProfilePic(value.path);
      }
      navigatePop(context);
    });
  }
}

class PickProfileImage extends StatelessWidget {
  final VoidCallback onTap;
  final String name;
  final IconData icon;

  const PickProfileImage({
  super.key,
  required this.onTap,
  required this.name,
  required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(
              bottom: 10,
              top: 30,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey.shade200,
              ),
            ),
            child: Icon(
              icon,
              color: context.colorScheme.secondary,
            ),
          ),
        ),
        Text(
          name,
          style: context.titleMedium!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
