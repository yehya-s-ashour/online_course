import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/my_cached_net_image.dart';
import 'package:swipe_to/swipe_to.dart';

import '/core/extensions/extensions.dart';
import '../../../../../domain/entities/message.dart';
import '../../../../controllers/chat_cubit/chat_cubit.dart';
import 'first_message_small_curved_bubble.dart';
import '../message_content/message_content.dart';
import 'message_replay_card.dart';

class MyMessageCard extends StatelessWidget {
  Message? message;
  final bool isFirst;
  final bool isGroup;
  final bool isReaction;
  final String index;

  MyMessageCard({
    super.key,
    required this.isFirst,
    this.message,
    required this.isGroup,
    required this.isReaction,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final isReplying = message!.repliedMessage.isNotEmpty;
    int all = 0;
    return SwipeTo(
      onRightSwipe: () {
          ChatCubit.get(context).onMessageSwipe(
              message: message!.text,
              isMe: true,
              messageType: message!.messageType,
              repliedTo: message!.senderName,
              repliedToUid: message!.senderId);
        
      },
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Padding(
          padding:
              EdgeInsetsDirectional.only(top: 5.h, start: isFirst ? 5 : 15),
          child: Container(
            color:  ((isReaction && (index == message!.messageId))
                    ?  context.colorScheme.surface.withOpacity(0.55)
                    : null),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: context.width(0.8),
                    maxHeight: 650.h,
                  ),
                  child: Stack(
                    children: [
                      Card(
                        elevation: 2,
                        margin: (message!.reaction!.length >= 1)
                            ? EdgeInsets.only(top: 15.h)
                            : isFirst
                                ? const EdgeInsetsDirectional.only(start: 0)
                                : const EdgeInsetsDirectional.only(end: 10),
                        color: 
                            ((isReaction && (index == message!.messageId))
                            ? context.colorScheme.surface.withOpacity(0.8)
                            : context.colorScheme.surface),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.only(
                            topStart: const Radius.circular(10),
                            bottomStart: const Radius.circular(10),
                            bottomEnd: const Radius.circular(10),
                            topEnd: isFirst
                                ? Radius.zero
                                : const Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (isReplying)
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child:  ReplayMessageCard(
                                        isGroup: false,
                                        text: message!.repliedMessage,
                                        repliedMessageType:
                                            message!.repliedMessageType,
                                        isMe: message!.repliedTo ==
                                            message!.senderName,
                                        repliedTo: message!.repliedTo,
                                      ),
                              ),
                            MessageContent(
                              isGroup: isGroup,
                              message: message,
                              isMe: true,
                            ),
                          ],
                        ),
                      ),
                      ],
                  ),
                ),
                if (isFirst)
                  Padding(
                    padding: ( message!.reaction!.length >= 1)
                        ? EdgeInsets.only(top: 15.h)
                        : const EdgeInsets.all(0),
                    child: const FirstMessageSmallCurvedBubble(
                      isMe: true,
                      isGroup: false,
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
