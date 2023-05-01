// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:messenging/core/utils/constants/assets_manager.dart';
// import 'package:messenging/features/domain/entities/message.dart';
// import 'package:messenging/features/presentation/views/chat/components/message_content/time_sent_widget.dart';
//
// import '../../../../../../core/functions/navigator.dart';
// import '../../../../../domain/entities/message_group.dart';
// import '../../../../components/my_cached_net_image.dart';
//
// class AudioPlayerWidget extends StatefulWidget {
//   Message? message;
//   MessageGroup? messageGroup;
//   String? receiverPic;
//   final bool isMe;
//   final bool isGroup;
//
//   AudioPlayerWidget({
//     super.key,
//     this.message,
//     this.messageGroup,
//     this.receiverPic,
//     required this.isMe,
//     required this.isGroup,
//   });
//
//   @override
//   State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
// }
//
// class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
//   AudioPlayer audioPlayer = AudioPlayer();
//   Duration? totalDuration;
//   Duration? newTiming;
//
//   bool isPlaying = false;
//   String text="";
//   void initAudio() {
//     debugPrint("Audio Initialized");
//     audioPlayer.play(UrlSource(text));
//     audioPlayer.getDuration().then((value) {
//       debugPrint(value.toString());
//     });
//     audioPlayer.onPositionChanged.listen((event) {
//       setState(() {
//         newTiming = event;
//       });
//     });
//     audioPlayer.onDurationChanged.listen((updatedDuration) {
//       totalDuration = updatedDuration;
//     });
//   }
//
//   void pauseAudio() {
//     audioPlayer.pause();
//   }
//
//   void stopAudio() {
//     audioPlayer.stop();
//   }
//
//   void seekAudio(Duration durationToSeek) {
//     audioPlayer.seek(durationToSeek);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Builder(
//       builder: (context) {
//         if(widget.isGroup){
//           text =stringToBase64Url.decode("${widget.messageGroup!.text.replaceFirst('${widget.messageGroup!.text.characters.first}','').characters.getRange(0,((widget.messageGroup!.text.replaceFirst('${widget.messageGroup!.text.characters.first}','')).length/2).toInt())}");
//         }else{
//           text =stringToBase64Url.decode("${widget.message!.text.replaceFirst('${widget.message!.text.characters.first}','').characters.getRange(0,((widget.message!.text.replaceFirst('${widget.message!.text.characters.first}','')).length/2).toInt())}");
//         }
//         return Padding(
//           padding: const EdgeInsets.all(5.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 55,
//                 child: Stack(
//                   children: [
//                     widget.isGroup
//                         ? Hero(
//                       tag: widget.messageGroup!.messageId,
//                       child: MyCachedNetImage(
//                         imageUrl: widget.messageGroup!.senderPic,
//                         radius: 28,
//                       ),
//                     )
//                         : widget.isMe
//                         ? Hero(
//                       tag: widget.message!.messageId,
//                       child: MyCachedNetImage(
//                         imageUrl: profilePicMe!,
//                         radius: 28,
//                       ),
//                     )
//                         : Hero(
//                       tag: widget.message!.messageId,
//                       child: MyCachedNetImage(
//                         imageUrl: widget.receiverPic!,
//                         radius: 28,
//                       ),
//                     ),
//                     const Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Icon(
//                         Icons.mic,
//                         color: Colors.black54,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   if (isPlaying) {
//                     pauseAudio();
//                     setState(() {
//                       isPlaying = !isPlaying;
//                     });
//                   } else {
//                     if (newTiming.toString() == "null") {
//                       initAudio();
//                     } else {
//                       audioPlayer.resume();
//                     }
//                     setState(() {
//                       isPlaying = !isPlaying;
//                     });
//                   }
//                 },
//                 child: Icon(
//                   isPlaying ? Icons.pause : Icons.play_arrow_rounded,
//                   size: 40,
//                   color: Colors.black54,
//                 ),
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                       height: 35,
//                       child: Slider(
//                         value: newTiming == null
//                             ? 0
//                             : newTiming!.inMilliseconds.toDouble(),
//                         min: 0,
//                         max: totalDuration == null
//                             ? 20
//                             : totalDuration!.inMilliseconds.toDouble(),
//                         activeColor: Colors.grey,
//                         inactiveColor: Colors.black38,
//                         onChanged: (value) {
//                           setState(() {
//                             seekAudio(Duration(milliseconds: value.toInt()));
//                           });
//                         },
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           (newTiming.toString() == "null")
//                               ? "0:00"
//                               : newTiming
//                               .toString()
//                               .split('.')
//                               .first,
//                           style: const TextStyle(color: Colors.grey, fontSize: 14),
//                         ),
//                         TimeSentWidget(
//                             isGroup: widget.isGroup,
//                             messageGroup: widget.messageGroup,
//                             message: widget.message,
//                             isMe: widget.isMe,
//                             textColor: Colors.grey)
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         );
//       }
//     );
//   }
// }
