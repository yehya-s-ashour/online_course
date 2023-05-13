import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:online_course/features/presentation/components/loader.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerCourseItem extends StatefulWidget {
  const VideoPlayerCourseItem({super.key, required this.videoPath});

  final String videoPath;

  @override
  _VideoPlayerCourseItemState createState() => _VideoPlayerCourseItemState();
}

class _VideoPlayerCourseItemState extends State<VideoPlayerCourseItem> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoPath);

    _videoPlayerController.initialize().then(
          (value) => setState(
            () => _chewieController = ChewieController(
                materialProgressColors: ChewieProgressColors(
                    bufferedColor: Colors.black.withOpacity(.15),
                    playedColor: Color.fromARGB(255, 240, 179, 88),
                    handleColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 246, 237, 229)),
                videoPlayerController: _videoPlayerController,
                aspectRatio: _videoPlayerController.value.aspectRatio),
          ),
        );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _videoPlayerController.closedCaptionFile;
    _chewieController.dispose();
    super.dispose();
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
              ],
            ),
          ),
        ),
      );
    }
  }
}
