import 'package:flutter/material.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/shared/message_replay.dart';

import 'message_replay_card.dart';

class MessageReplayPreview extends StatelessWidget {
  final MessageReplay messageReplay;
  final bool isGroup;

  MessageReplayPreview({
    super.key,
    required this.messageReplay,
    required this.isGroup,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        //color: Colors.white12,
        color: userEntity.theme == 'Light' ? Colors.white : Color(0xFF233138),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(12),
          topLeft: Radius.circular(12),
        ),
      ),
      child: ReplayMessageCard(
        //messageReplay: messageReplay,
        showCloseButton: true,
        isMe: messageReplay.isMe,
        isGroup: isGroup,
        text: messageReplay.message,
        repliedMessageType: messageReplay.messageType,
        repliedTo: messageReplay.repliedTo,
      ),
    );
  }
}
