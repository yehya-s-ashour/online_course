import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_course/core/generated/assets.dart';
import 'package:online_course/features/presentation/components/show_full_screen_image.dart';

Future<void> showContactProfilePicDialog(
  BuildContext context, {
  required String name,
  required String contactId,
  required String profilePic,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        scrollable: true,
        contentPadding: EdgeInsets.zero,
        alignment: Alignment.topCenter,
        backgroundColor:
            Colors.white,
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
                      Image.asset(Assets.assetsSplash1),
                      const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ),
                  errorWidget: (context, url, error) {
                      return Image.asset(Assets.assetsSplash1);
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
          IconButton(
            onPressed: () {
              // Get.to(ChatScreen(
              //   name: name,
              //   uId: contactId,
              //   receiverPic: profilePic,
              //   isGroup: isGroup,
              // ));
            },
            icon: Icon(
              Icons.message,
              color: Color(0xFF176b5b),
              size: 25,
            ),
          ),
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
              color: Color(0xFF176b5b),
              size: 25,
            ),
          ),
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
              color: Color(0xFF176b5b),
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
              color: Color(0xFF176b5b),
              size: 25,
            ),
          ),
        ],
      );
    },
  );
}
