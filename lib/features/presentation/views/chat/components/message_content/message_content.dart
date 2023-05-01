import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/enums/messge_type.dart';
import '../../../../../domain/entities/message.dart';
import 'audio_player_widget.dart';
import 'image_widget.dart';
import 'text_widget.dart';
import 'video_palyer_widget.dart';

class MessageContent extends StatelessWidget {
  final Message? message;
  final String? receiverPic;
  final bool isMe;
  final bool isGroup;

  MessageContent({
    super.key,
    this.message,
    this.receiverPic,
    required this.isMe,
    required this.isGroup,
  });

  @override
  Widget build(BuildContext context) {
  
    
      switch (message!.messageType) {
        case MessageType.text:
          return TextWidget(
              message: message,
              isGroup: isGroup,
              isMe: isMe);
        case MessageType.image:
          return ImageWidget(
              message: message,
              isMe: isMe);
        case MessageType.video:
          return Container(
            height: 450.h,
            child: VideoPlayerItem(
                message: message,
                isGroup: isGroup,
                isMe: isMe),
          );
        default:
          return TextWidget(
              message: message,
              isGroup: isGroup,
              isMe: isMe);
      
    }
  }
}
