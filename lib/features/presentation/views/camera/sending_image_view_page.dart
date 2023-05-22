import 'dart:io';
import 'package:flutter/material.dart';
import 'package:online_course/core/shared/commen.dart';
import 'components/image_view_top_row_icons.dart';
import 'components/sending_image_video_bottom_roww_widget.dart';

class SendingImageViewPage extends StatefulWidget {
  String path;
  final String receiverId;

  SendingImageViewPage({
    super.key,
    required this.path,
    required this.receiverId,
  });

  @override
  State<SendingImageViewPage> createState() => _SendingImageViewPageState();
}

class _SendingImageViewPageState extends State<SendingImageViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Image.file(
              File(widget.path),
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
              filterQuality: FilterQuality.low,
              repeat: ImageRepeat.noRepeat,
              cacheHeight: 980,
              cacheWidth: 754,
            ),
            ImageViewTopRowIcons(
              onCropButtonTaped: () {
                cropImage(widget.path).then((value) {
                  widget.path = value!.path;
                  setState(() {});
                });
              },
            ),
            Positioned(
              bottom: 5,
              right: 0,
              left: 0,
              child: SendingImageVideoBottomRowWidget(
                onSendButtonTaped: () {
                  // if (widget.isGroup) {
                  // ChatCubit.get(context).sendFileMessageGroup(
                  //   receiverId: widget.receiverId,
                  //   messageType: MessageType.image,
                  //   file: File(widget.path),
                  // );

                  // } else {
                  // ChatCubit.get(context).sendFileMessage(
                  //   profilePic: userdata!.profilePic,
                  //   phoneNumber: userdata!.phoneNumber,
                  //   name: userdata!.name,
                  //   receiverId: widget.receiverId,
                  //   messageType: MessageType.image,
                  //   file: File(widget.path),
                  // );

                  // }
                  //to back to chat screen
                  int count = 0;
                  Navigator.of(context).popUntil((route) => count++ >= 4);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
