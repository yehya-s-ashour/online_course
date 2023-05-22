import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/functions/time.dart';
import 'package:online_course/features/domain/entities/message.dart';
import 'package:online_course/features/presentation/components/show_full_screen_image.dart';
import 'package:online_course/features/presentation/views/chat/components/message_content/time_sent_widget.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({
    super.key,
    this.message,
    required this.isMe,
  });

  Message? message;
  final bool isMe;
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Builder(builder: (context) {
        text = stringToBase64Url.decode(
            "${message!.text.replaceFirst('${message!.text.characters.first}', '').characters.getRange(0, ((message!.text.replaceFirst('${message!.text.characters.first}', '')).length / 2).toInt())}");

        return InkWell(
          onTap: () {
            Get.to(
                ShowFullScreenImage(
                    name: isMe
                        ? userEntity.language == 'Arabic'
                            ? "أنت"
                            : 'You'
                        : message!.senderName,
                    image: text,
                    timeSent:
                        getTime(message!.timeSent).millisecondsSinceEpoch),
                transition: transition[2]);
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 500.h,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: text,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                      placeholder: (context, url) => const SizedBox(),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 8,
                    child: TimeSentWidget(
                      message: message,
                      isMe: isMe,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
