import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/features/presentation/controllers/bottom_chat_cubit/bottom_chat_cubit.dart';

import '/core/extensions/extensions.dart';

class EmojiPickerWidget extends StatelessWidget {
  final TextEditingController messageController;
  final VoidCallback onGifButtonTap;

  const EmojiPickerWidget({
    super.key,
    required this.onGifButtonTap,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomChatCubit, BottomChatState>(
        builder: (context, state) {
          var cubit = BottomChatCubit.get(context);
          return SizedBox(
            height: 250.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                    cubit.onTextFieldValChanged(messageController.text);
                  },
                  onBackspacePressed: () {
                    messageController.text.trimRight();
                    cubit.onTextFieldValChanged(messageController.text);
                  },

                  textEditingController: messageController,
                  config: Config(
                    columns: 8,
                    iconColorSelected: context.colorScheme.secondary,
                    indicatorColor: context.colorScheme.secondary,
                    backspaceColor: Colors.black26,
                  ),
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  color: Colors.grey[200],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: onGifButtonTap,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              width: 2,
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          child: const Icon(
                            Icons.gif,
                            size: 30,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {});
  }
}
