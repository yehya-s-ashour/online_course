import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/extensions/extensions.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/shared/message_replay.dart';
import 'package:online_course/features/presentation/controllers/bottom_chat_cubit/bottom_chat_cubit.dart';
import 'package:online_course/features/presentation/controllers/chat_cubit/chat_cubit.dart';
import 'package:online_course/features/presentation/views/camera/camera_screen.dart';
import 'attchment_pop_up.dart';
import '../message/message_replay_preview.dart';

class BottomChatField extends StatelessWidget {
  final TextEditingController messageController;
  final FocusNode focusNode;
  final Function(String) onTextFieldValueChanged;
  final bool isShowEmoji;
  final VoidCallback toggleEmojiKeyboard;
  final String receiverId;
  final bool isGroup;

  const BottomChatField({
    super.key,
    required this.messageController,
    required this.focusNode,
    required this.onTextFieldValueChanged,
    required this.isShowEmoji,
    required this.toggleEmojiKeyboard,
    required this.receiverId,
    required this.isGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Container(
        width: MediaQuery.of(context).size.width - 65,
        margin: const EdgeInsets.only(
          right: 5,
        ),
        decoration: BoxDecoration(
          // color: userEntity!.theme == 'Light' ? Colors.white : Color(0xFF233138),
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Column(
          children: [
            BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                MessageReplay? messageReplay =
                    ChatCubit.get(context).messageReplay;
                if (messageReplay == null) {
                  return const SizedBox();
                }
                return MessageReplayPreview(
                  isGroup: isGroup,
                  messageReplay: messageReplay,
                );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  width: 35,
                  child: IconButton(
                    onPressed: toggleEmojiKeyboard,
                    color: Colors.grey,
                    iconSize: 25,
                    icon: Icon(
                      isShowEmoji
                          ? Icons.keyboard
                          : Icons.emoji_emotions_outlined,
                    ),
                  ),
                ),
                BlocConsumer<BottomChatCubit, BottomChatState>(
                    builder: (context, state) {
                      return Flexible(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: double.infinity,
                            maxWidth: double.infinity,
                            minHeight: 25,
                            maxHeight: 135,
                          ),
                          child: Scrollbar(
                            child: TextField(
                              onChanged: onTextFieldValueChanged,
                              onTap: () {
                                BottomChatCubit.get(context)
                                    .hideEmojiContainer();
                              },
                              controller: messageController,
                              cursorColor: context.colorScheme.secondary,
                              focusNode: focusNode,
                              cursorHeight: 30.h,
                              textDirection: TextDirection.ltr,
                              // textDirection: userEntity!.language == 'Arabic' ? TextDirection.rtl:TextDirection.ltr,

                              cursorWidth: 3.w,
                              textInputAction: TextInputAction.newline,
                              style: TextStyle(
                                fontSize: 20.spMin,
                                //color: AppColors.blackLight,
                                color: context.colorScheme.onTertiaryContainer,
                                // color: userEntity!.theme == 'Light'
                                // ? context.colorScheme.onTertiaryContainer
                                // : Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,

                                // fillColor: userEntity!.theme == 'Light'
                                // ? Colors.white
                                // : Color(0xFF233138),
                                // hintText: userEntity!.language == 'Arabic' ? ' رسالة...': 'Message...',
                                hintText: userEntity.language == 'Arabic'
                                    ? "أرسل رسالة..."
                                    : 'Message...',

                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20.spMin,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    listener: (context, state) {}),
                AttchementPopUp(
                  isGroup: isGroup,
                  receiverId: receiverId,
                ),
                // if (messageController.text.isEmpty)
                //   IconButton(
                //     onPressed: () {
                //       Get.to(CameraScreen(receiverId: receiverId,isGroup:isGroup));
                //     },
                //     color: Colors.grey,
                //     iconSize: 26,
                //     icon: const Icon(Icons.camera_alt_rounded),
                //   ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
