import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/enums/messge_type.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/controllers/chat_cubit/chat_cubit.dart';

class ReplayMessageCard extends StatelessWidget {
  final bool showCloseButton;
  final MessageType repliedMessageType;
  String text;
  final bool isMe;
  final bool isGroup;
  final String repliedTo;
  final String? repliedToUid;

  //final MessageReplay messageReplay;

  ReplayMessageCard({
    super.key,
    this.showCloseButton = false,
    required this.repliedMessageType,
    required this.text,
    required this.isMe,
    required this.repliedTo,
    this.repliedToUid,
    required this.isGroup,
  });

  @override
  Widget build(BuildContext context) {
    int colors = isGroup ? repliedToUid.hashCode ^ 8151195225 : 1;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 5,
          top: 5,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          //color: Color(0xffF5F7F6),
          color: userEntity.theme == 'Light'
              ? Colors.black.withOpacity(0.03)
              : Color(0xFF233138),
          border: Border(
            left: BorderSide(
              color: isGroup
                  ? (repliedToUid == userEntity.uId
                      ? mixedColor!
                      : Color(colors))
                  : isMe
                      ? mixedColor!
                      : isGroup
                          ? Color(colors)
                          : Colors.deepPurple,
              width: 5,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    isGroup
                        ? (repliedToUid == userEntity.uId ? 'You' : repliedTo)
                        : (isMe ? 'You' : repliedTo),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isGroup
                          ? (repliedToUid == userEntity.uId
                              ? mixedColor!
                              : Color(colors))
                          : isMe
                              ? mixedColor!
                              : isGroup
                                  ? Color(colors)
                                  : Colors.deepPurple,
                      fontSize: 18.spMin,
                    ),
                  ),
                ),
                if (showCloseButton)
                  GestureDetector(
                    onTap: () {
                      ChatCubit.get(context).cancelReplay();
                    },
                    child: const Icon(
                      Icons.close,
                      size: 16,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 8),
            ReplayMessageContent(
              repliedMessageType: repliedMessageType,
              text: text,
            ),
          ],
        ),
      ),
    );
  }
}

class ReplayMessageContent extends StatelessWidget {
  //final MessageReplay messageReplay;
  final MessageType repliedMessageType;
  String text;

  ReplayMessageContent({
    super.key,
    required this.repliedMessageType,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    text = stringToBase64Url.decode(
        "${text.replaceFirst('${text.characters.first}', '').characters.getRange(0, (text.replaceFirst('${text.characters.first}', '')).length ~/ 2)}");
    switch (repliedMessageType) {
      case MessageType.text:
        return Text(
          text,
          style: TextStyle(
              color:
                  userEntity.theme == 'Light' ? Colors.black38 : Colors.white,
              fontSize: 18.spMin),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        );
      case MessageType.image:
        return Row(
          children: [
            Icon(
              Icons.image,
              color:
                  userEntity.theme == 'Light' ? Colors.black38 : Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'Photo',
              style: TextStyle(
                  color: userEntity.theme == 'Light'
                      ? Colors.black38
                      : Colors.white,
                  fontSize: 14),
            ),
          ],
        );
      case MessageType.gif:
        return Row(
          children: [
            Icon(
              Icons.gif,
              color:
                  userEntity.theme == 'Light' ? Colors.black38 : Colors.white,
            ),
            Text(
              'GIF',
              style: TextStyle(
                  color: userEntity.theme == 'Light'
                      ? Colors.black38
                      : Colors.white,
                  fontSize: 14),
            ),
          ],
        );
      case MessageType.video:
        return Row(
          children: [
            Icon(
              Icons.videocam,
              color:
                  userEntity.theme == 'Light' ? Colors.black38 : Colors.white,
            ),
            Text(
              'Video',
              style: TextStyle(
                  color: userEntity.theme == 'Light'
                      ? Colors.black38
                      : Colors.white,
                  fontSize: 14),
            ),
          ],
        );
      case MessageType.audio:
        return Row(
          children: [
            Icon(
              Icons.mic,
              size: 18,
              color:
                  userEntity.theme == 'Light' ? Colors.black38 : Colors.white,
            ),
            Text(
              'Voice message',
              style: TextStyle(
                  color: userEntity.theme == 'Light'
                      ? Colors.black38
                      : Colors.white,
                  fontSize: 14),
            ),
          ],
        );
      default:
        return Text(
          text,
          style: TextStyle(
              color:
                  userEntity.theme == 'Light' ? Colors.black38 : Colors.white,
              fontSize: 18.spMin),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        );
    }
  }
}
