import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/domain/entities/message.dart';
import 'package:online_course/features/presentation/components/loader.dart';
import 'package:online_course/features/presentation/views/chat/components/message_content/time_sent_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  Message? message;
  final bool isMe;
  final bool isGroup;

  VideoPlayerItem({
    super.key,
    this.message,
    required this.isMe,
    required this.isGroup,
  });

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  // late CachedVideoPlayerController videoPlayerController;
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool isPlay = false;
  String text = "";
  @override
  void initState() {
    super.initState();

    text = stringToBase64Url.decode(
        "${widget.message!.text.replaceFirst('${widget.message!.text.characters.first}', '').characters.getRange(0, ((widget.message!.text.replaceFirst('${widget.message!.text.characters.first}', '')).length / 2).toInt())}");
    _videoPlayerController = VideoPlayerController.network(text);
    _videoPlayerController.initialize().then(
          (value) => setState(
            () => _chewieController = ChewieController(
                videoPlayerController: _videoPlayerController,
                aspectRatio: _videoPlayerController.value.aspectRatio),
          ),
        );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_videoPlayerController.value.isInitialized) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: Stack(
              children: [
                Chewie(
                  controller: _chewieController,
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: TimeSentWidget(
                    message: widget.message,
                    isMe: widget.isMe,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Stack(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    VideoPlayer(_videoPlayerController),
                    Center(
                      child: Loader(),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  right: 4,
                  child: TimeSentWidget(
                    message: widget.message,
                    isMe: widget.isMe,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
