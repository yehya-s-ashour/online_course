import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:giphy_get/giphy_get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/shared/commen.dart';
import 'package:online_course/features/presentation/controllers/bottom_chat_cubit/bottom_chat_cubit.dart';
import 'package:online_course/features/presentation/controllers/chat_cubit/chat_cubit.dart';
import 'package:online_course/features/presentation/views/camera/camera_screen.dart';

import 'bottom_chat_field.dart';
import 'emoji_picker_widget.dart';

class BottomChatWithIcon extends StatefulWidget {
  final String receiverId;
  final bool isGroup;

  const BottomChatWithIcon({
    super.key,
    required this.receiverId,
    required this.isGroup,
  });

  @override
  State<BottomChatWithIcon> createState() => _BottomChatWithIconState();
}

class _BottomChatWithIconState extends State<BottomChatWithIcon> {
  final TextEditingController messageController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        //hideEmojiContainer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomChatCubit, BottomChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        BottomChatCubit cubit = BottomChatCubit.get(context);
        return Directionality(
          textDirection: TextDirection.ltr,
          child: WillPopScope(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BottomChatField(
                        receiverId: widget.receiverId,
                        isGroup: widget.isGroup,
                        focusNode: focusNode,
                        isShowEmoji: cubit.isShowEmoji,
                        messageController: messageController,
                        onTextFieldValueChanged: (val) =>
                            cubit.onTextFieldValChanged(val),
                        toggleEmojiKeyboard: () =>
                            cubit.toggleEmojiKeyboard(focusNode),
                      ),
                      if (cubit.isShownSendButton)
                        BlocBuilder<ChatCubit, ChatState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {
                                if (widget.isGroup) {
                                  // ChatCubit.get(context).sendTextMessageGroup(
                                  //   text: messageController.text.trim(),
                                  //   receiverId: widget.receiverId,
                                  // );

                                  // SettingCubit.get(context).sendNotification(body: messageController.text.trim());
                                } else {
                                  // ChatCubit.get(context).sendTextMessage(
                                  //   profilePic: userdata!.profilePic,
                                  //   phoneNumber: userdata!.phoneNumber,
                                  //   name: userdata!.name,
                                  //   text: messageController.text.trim(),
                                  //   receiverId: widget.receiverId,
                                  // );
                                  // SettingCubit.get(context).sendNotification(body: messageController.text.trim());
                                }
                                messageController.clear();
                                cubit.ChangedStats();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50.00),
                                  color: mixedColor,
                                ),
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.send,
                                  color: Colors.teal[50],
                                ),
                              ),
                            );
                          },
                        ),
                      if (!cubit.isShownSendButton)
                        GestureDetector(
                          onTap: () {
                            selectImageFromCamera(context);
                            // Get.to(CameraScreen(receiverId: widget.receiverId));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.00),
                              color: mixedColor,
                            ),
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.teal[50],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Offstage(
                  offstage: !cubit.isShowEmoji,
                  child: BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) {
                      return EmojiPickerWidget(
                        messageController: messageController,
                        onGifButtonTap: () {
                          selectGif(ChatCubit.get(context));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            onWillPop: () {
              if (cubit.isShowEmoji) {
                cubit.hideEmojiContainer();
              } else {
                Navigator.pop(context);
              }
              return Future.value(false);
            },
          ),
        );
      },
    );
  }

  void selectGif(ChatCubit cubit) async {
    final gif = await pickGif(context);
    sendGifMessage(gif, cubit);
  }

  void sendGifMessage(GiphyGif? gif, ChatCubit cubit) {
    if (gif != null) {
      if (widget.isGroup) {
        // cubit.sendGifMessageGroup(
        //   receiverId: widget.receiverId,
        //   gifUrl: gif.url!,
        // );
      } else {
        // cubit.sendGifMessage(
        //   receiverId: widget.receiverId,
        //   gifUrl: gif.url!,
        //   profilePic: userdata!.profilePic,
        //   phoneNumber: userdata!.phoneNumber,
        //   name: userdata!.name,
        // );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }
  void selectImageFromCamera(BuildContext context) async {
    File? image = await pickImageFromCamera(context);
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
      // Get.to(SendingVideoViewPage(
      //     path: image.path, receiverId: receiverId, isGroup: isGroup));
    }
  }
}
