import 'package:flutter/material.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'components/bottom_field/bottom_chat_with_icon.dart';
import 'components/chat_appbar.dart';
import 'components/message/messages_list.dart';

class ChatScreen extends StatelessWidget {
  final String name;
  final String uId;
  final String receiverPic;
  final bool isGroup;

  const ChatScreen(
      {super.key,
      required this.name,
      required this.uId,
      required this.receiverPic,
      required this.isGroup});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.grey[200],
            // resizeToAvoidBottomInset: false,
            appBar: ChatAppBar(
                name: name,
                receiverId: uId,
                receiverPic: receiverPic,
                isGroup: isGroup),
            body:Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MessagesList(
                      receiverId: uId,
                      isGroup: isGroup,
                      receiverPic: receiverPic,
                    ),
                  BottomChatWithIcon(
                                receiverId: uId, isGroup: isGroup,
                              ), ],
                ),
          ),
        ],
      ),
    );
  }
}