
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/shared/commen.dart';
import 'package:online_course/features/presentation/views/camera/sending_video_view_page.dart';

import '../image/show_image.dart';

class AttchementPopUp extends StatelessWidget {
  final String receiverId;
  final bool isGroup;
   AttchementPopUp({
     required this.receiverId,
     required this.isGroup,
    super.key,
  });
  void selectVideoFromGallery(BuildContext context) async {
    File? image = await pickVideoFromGallery(context);
    //if (!mounted) return;
    if (image != null) {
      // ignore: use_build_context_synchronously
      // Navigator.of(context).pushNamed(
      //   Routes.sendingVideoViewRoute,
      //   arguments: {
      //     'path': image.path,
      //     'uId': receiverId,
      //     'isGroup':isGroup,
      //   },
      // );
      Get.to(SendingVideoViewPage(path: image.path,receiverId: receiverId,isGroup:isGroup));
    }
  }
  void selectVideoFromCamera(BuildContext context) async {
    File? image = await pickVideoFromCamera(context);
    //if (!mounted) return;
    if (image != null) {
      // ignore: use_build_context_synchronously
      // Navigator.of(context).pushNamed(
      //   Routes.sendingVideoViewRoute,
      //   arguments: {
      //     'path': image.path,
      //     'uId': receiverId,
      //     'isGroup':isGroup,
      //   },
      // );
            Get.to(SendingVideoViewPage(path: image.path,receiverId: receiverId,isGroup:isGroup));

    }
  }
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      //RotationTransition to rotate icon with degree
      icon: const RotationTransition(
        turns: AlwaysStoppedAnimation(-40 / 360),
        child: Icon(
          Icons.attach_file,
          color: Colors.grey,
          size: 26,
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
     // offset: const Offset(0, -340),
      offset: const Offset(0, -150),
      onSelected: (val) {
         if (FocusScope.of(context).hasFocus) {
          Future.delayed(const Duration(milliseconds: 50)).whenComplete(
            () {
              FocusScope.of(context).unfocus();
              FocusScope.of(context).dispose();
            },
          );
        }
      },
      onCanceled: () {
        if (!FocusScope.of(context).hasFocus) {
          Future.delayed(const Duration(milliseconds: 50))
              .whenComplete(() => FocusScope.of(context).unfocus());
          FocusScope.of(context).dispose();
        }
      },
      constraints: const BoxConstraints.tightFor(width: double.infinity),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            padding: const EdgeInsets.only(left: 40, right: 40, bottom: 15),
            enabled: false,
            onTap: () {},
            child: Wrap(
              spacing: 8,
              runAlignment: WrapAlignment.spaceBetween,
              children: [
                AttchmentCard(
                  name: 'Vidoe',
                  color: Colors.deepPurpleAccent,
                  icon: Icons.slow_motion_video_outlined,
                  onPress: () {
                    selectVideoFromGallery(context);
                  },
                ),
                AttchmentCard(
                  name: 'Camera',
                  color: Colors.redAccent,
                  icon: Icons.camera_alt,
                  onPress: () {
                    selectVideoFromCamera(context);
                  },
                ),
                AttchmentCard(
                  name: 'Gallery',
                  color: Colors.purpleAccent,
                  icon: Icons.photo,
                  onPress: () {
                    Get.to(Images(receiverId: receiverId,index: 1,));
                  },
                ),
                // AttchmentCard(
                //   name: 'Audio',
                //   color: Colors.deepOrange,
                //   icon: Icons.headset_mic_rounded,
                //   onPress: () {},
                // ),
                // AttchmentCard(
                //   name: 'Location',
                //   color: Colors.green,
                //   icon: Icons.location_on,
                //   onPress: () {
                //   },
                // ),
                // AttchmentCard(
                //   name: 'Contact',
                //   color: Colors.cyan,
                //   icon: Icons.person,
                //   onPress: () {
                //     FlutterContacts.openExternalPick();
                //   },
                // ),
                // AttchmentCard(
                //   name: 'Poll',
                //   color: Colors.teal,
                //   icon: Icons.poll,
                //   onPress: () {},
                // ),
              ],
            ),
          ),
        ];
      },
    );
  }
}

class AttchmentCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final VoidCallback onPress;

  const AttchmentCard({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: color,
            child: IconButton(
              onPressed: onPress,
              splashRadius: 28,
              color: Colors.white,
              icon: Icon(icon),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(name),
        ],
      ),
    );
  }

}

