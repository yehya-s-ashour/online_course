import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/extensions/extensions.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/domain/entities/message.dart';
import 'package:online_course/features/presentation/controllers/chat_cubit/chat_cubit.dart';
import 'package:swipe_to/swipe_to.dart';

import '../message_content/message_content.dart';
import 'first_message_small_curved_bubble.dart';
import 'message_replay_card.dart';

class SenderMessageCard extends StatelessWidget {
  final Message? message;
  final String? receiverPic;
  final bool isFirst;
  final bool isGroup;
  final bool isReaction;
  final String index;

  SenderMessageCard({
    super.key,
    this.receiverPic,
    this.message,
    required this.isFirst,
    required this.isGroup,
    required this.isReaction,
    required this.index,
  });

  int all = 0;

  @override
  Widget build(BuildContext context) {
    int colors = isGroup
        ? userEntity.theme == 'Light'
            ? message!.senderId.hashCode ^ 8151195225
            : message!.senderId.hashCode ^ 8131195225
        : 1;

    final isReplying = message!.repliedMessage.isNotEmpty;
    return SwipeTo(
      onLeftSwipe: () {
        ChatCubit.get(context).onMessageSwipe(
          message: message!.text,
          isMe: false,
          messageType: message!.messageType,
          repliedTo: message!.senderName,
          repliedToUid: message!.senderId,
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(
            top: isGroup && isFirst ? 15.0 : 2.5,
            left: isFirst ? 5 : 15,
          ),
          child: Container(
            color: ((isReaction && (index == message!.messageId))
                ? context.colorScheme.background.withOpacity(0.55)
                : null),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (isFirst)
                  Padding(
                    padding: (message!.reaction!.length >= 1)
                        ? EdgeInsets.only(top: 15.h)
                        : const EdgeInsets.all(0),
                    child: FirstMessageSmallCurvedBubble(
                      isMe: false,
                      isGroup: isGroup,
                    ),
                  ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: context.width(0.8),
                    maxHeight: 650.h,
                  ),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 0,
                        margin: (message!.reaction!.length >= 1)
                            ? EdgeInsets.only(top: 15.h)
                            : isFirst
                                ? const EdgeInsetsDirectional.only(start: 0)
                                : userEntity.language != 'Arabic'
                                    ? const EdgeInsetsDirectional.only(start: 0)
                                    : const EdgeInsetsDirectional.only(
                                        start: 10),
                        color: userEntity.theme == 'Light'
                            ? ((isReaction && (index == message!.messageId))
                                ? context.colorScheme.background
                                    .withOpacity(0.8)
                                : Colors.white)
                            : ((isReaction && (index == message!.messageId))
                                ? context.colorScheme.background
                                    .withOpacity(0.8)
                                : Color(0xFF233138)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: userEntity.language != 'Arabic'
                                ? isFirst
                                    ? Radius.zero
                                    : const Radius.circular(10)
                                : const Radius.circular(10),
                            bottomRight: const Radius.circular(10),
                            bottomLeft: const Radius.circular(10),
                            topRight: userEntity.language == 'Arabic'
                                ? isFirst
                                    ? Radius.zero
                                    : const Radius.circular(10)
                                : const Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (isGroup && isFirst)
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 10.0, start: 10.0),
                                child: Text(
                                  '${message!.senderName}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(color: Color(colors)),
                                ),
                              ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ReplayMessageCard(
                                    isGroup: isGroup,
                                    text: message!.repliedMessage,
                                    repliedMessageType:
                                        message!.repliedMessageType,
                                    isMe: message!.repliedTo !=
                                        message!.senderName,
                                    repliedTo: message!.repliedTo,
                                    repliedToUid: message!.repliedToUid,
                                  ),
                                ),
                                MessageContent(
                                  isMe: false,
                                  isGroup: isGroup,
                                  message: message,
                                  receiverPic: receiverPic,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// int getLength(Iterable<String> s){
//   s.forEach((element) {
//     s
//   })
// }
