import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/functions/navigator.dart';
import '/features/presentation/views/chat/components/message_content/time_sent_widget.dart';
import '/core/extensions/extensions.dart';
import '../../../../../domain/entities/message.dart';

class TextWidget extends StatelessWidget {
  TextWidget({
    super.key,
    this.message,
    required this.isMe,
    required this.isGroup,
  });

  Message? message;
  final bool isMe;
  final bool isGroup;
  String text="";
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
          text=stringToBase64Url.decode("${message!.text.replaceFirst('${message!.text.characters.first}','').characters.getRange(0,((message!.text.replaceFirst('${message!.text.characters.first}','')).length/2).toInt())}");
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          alignment: WrapAlignment.end,
          children: [
            if (text.indexOf('https://') == 0)
              GestureDetector(
                onTap: () async {
                  final Uri youtubUrl = Uri.parse(text);
                  if (await canLaunchUrl(youtubUrl)) {
                    await launchUrl(youtubUrl);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: userEntity.fontType == 'Small'
                        ? TextStyle(fontSize: 16.spMin, color: Colors.blue)
                        : (userEntity.fontType == 'Medium'
                            ? TextStyle(fontSize: 20.spMin, color: Colors.blue)
                            : TextStyle(fontSize: 24.spMin, color: Colors.blue)),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            if (text.indexOf('https://') != 0)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 595.h
                  ),
                  child: SelectableText(
                    text,
                    style: userEntity.fontType == 'Small'
                        ? TextStyle(
                        fontSize: 16.spMin,
                        height: 1.h,
                        color: userEntity.theme =='Light' ? Colors.grey.shade700 : Colors.white
                    )
                        : (userEntity.fontType == 'Medium'
                        ? TextStyle(
                        fontSize: 20.spMin,
                        height: 0.8.h,
                        color: userEntity.theme =='Light' ? Colors.grey.shade700 : Colors.white
                    )
                        : TextStyle(
                        fontSize: 24.spMin,
                        height: 1.h,
                        color: userEntity.theme =='Light' ? Colors.grey.shade700 : Colors.white
                    )),
                  ),
                ),
              ),
            TimeSentWidget(
              message: message,
              isMe: isMe,
              textColor: Colors.grey,
            ),
          ],
        );
      }
    );
  }
}
