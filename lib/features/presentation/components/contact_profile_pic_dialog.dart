import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_course/core/extensions/extensions.dart';
import 'package:online_course/core/utils/constants/assets_manager.dart';
import 'package:online_course/features/presentation/views/chat/chat_screen.dart';
import '../views/chat/components/image/show_full_screen_image.dart';

Future<void> showContactProfilePicDialog(
  BuildContext context, {
  required String name,
  required String contactId,
  required String profilePic,
  required bool isGroup,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        alignment: Alignment.topCenter,
        backgroundColor: Colors.white,
        // serEntity!.theme == 'Light' ? Colors.white : Color(0xFF233138),
        content: InkWell(
          onTap: () {
            Get.to(ShowFullScreenImage(
              name: name,
              image: profilePic,
            ));
          },
          child: Stack(
            children: [
              Hero(
                tag: contactId,
                child: CachedNetworkImage(
                  width: 400,
                  height: 300,
                  imageUrl: profilePic,
                  placeholder: (context, url) => Stack(
                    children: [
                      if (isGroup) Image.asset(AppImage.photoGroup),
                      if (!isGroup) Image.asset(AppImage.genericProfileImage),
                      const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ),
                  errorWidget: (context, url, error) {
                    if (isGroup) {
                      return Image.asset(AppImage.photoGroup);
                    } else {
                      return Image.asset(AppImage.genericProfileImage);
                    }
                  },
                  //height: 180.0,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  color: Colors.black26,
                  child: Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        actionsPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        actions: [
          if (isGroup)
            SizedBox(
              width: 30.w,
            ),
          IconButton(
            onPressed: () {
              Get.to(ChatScreen(
                name: name,
                uId: contactId,
                receiverPic: profilePic,
                isGroup: isGroup,
              ));
            },
            icon: Icon(
              Icons.message,
              color: context.colorScheme.secondaryContainer,
              size: 25,
            ),
          ),
          if (!isGroup)
            IconButton(
              onPressed: () {
                // CallCubit.get(context).makeCall(
                //     receiverId: contactId,
                //     receiverName: name,
                //     receiverPic: profilePic,
                //     isVideo: false,
                //     context: context);
              },
              icon: Icon(
                Icons.call,
                color: context.colorScheme.secondaryContainer,
                size: 25,
              ),
            ),
          if (!isGroup)
            IconButton(
              onPressed: () {
                // CallCubit.get(context).makeCall(
                //     receiverId: contactId,
                //     receiverName: name,
                //     receiverPic: profilePic,
                //     isVideo: true,
                //     context: context);
              },
              icon: Icon(
                Icons.videocam,
                color: context.colorScheme.secondaryContainer,
                size: 25,
              ),
            ),
          IconButton(
            onPressed: () {
              // Get.to(SenderUserProfilePage(
              //   user: userdata!,
              // ));
            },
            icon: Icon(
              Icons.info_outline_rounded,
              color: context.colorScheme.secondaryContainer,
              size: 25,
            ),
          ),
          if (isGroup)
            SizedBox(
              width: 30.w,
            ),
        ],
      );
    },
  );
}
