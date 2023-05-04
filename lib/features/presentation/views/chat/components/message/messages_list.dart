import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_course/core/functions/time.dart';

import '../../../../../../core/functions/navigator.dart';
import '/core/extensions/extensions.dart';
import '/core/extensions/time_extension.dart';
import '../../../../../../core/functions/date_converter.dart';
import '../../../../../domain/entities/message.dart';
import '../../../../controllers/chat_cubit/chat_cubit.dart';
import 'sender_message_card.dart';
import 'my_message_card.dart';

enum Reactions { like, laugh, love, angry, none }

class MessagesList extends StatefulWidget {
  final String receiverId;
  final bool isGroup;
  final String receiverPic;

  MessagesList({
    super.key,
    required this.receiverId,
    required this.isGroup,
    required this.receiverPic,
  });

  @override
  State<MessagesList> createState() => _MessagesGroupListState();
}

class _MessagesGroupListState extends State<MessagesList> {
  int numberMessages = 50;
  int i = 0;
  // bool isNumberMessagesAdd = true;
  bool isOpen = true;
  // late Stream<List<Message>> _messagesStream;

  late ScrollController messageController = ScrollController();

  @override
  void initState() {
    super.initState();
    // _messagesStream = ChatCubit.get(context)
    //     .getChatMessages(widget.receiverId, 0,numberMessages);

    // messageController.addListener(() {
    //   if (messageController.position.atEdge) {
    //     if (messageController.position.pixels == 0) {
    //       // Load more messages when reaching the top of the list
    //       if (messagesGroup.length >= numberMessages) _loadMoreMessages();
    //     }
    //   }
    // });
  }

  // Future<void> _loadMoreMessages() async {
  //   numberMessages+=50;
  //   isOpen=false;
  //   // print('${i++}hiassssssssss$numberMessages');
  //   // Stream<List<Message>> _messagesStream = ChatCubit.get(context)
  //   //     .getChatMessages(widget.receiverId, messages.last.timeSent,numberMessages);
  //   // // newMessagesStream.first.then((value) {
  //   // //   print(value[0].senderId);
  //   // // });
  //   // print(messages.length);
  //   // _messagesStream = _messagesStream
  //   //     .takeWhile((_) => false)
  //   //     .asyncExpand((_) => newMessagesStream);
  //   setState(() {

  //   });
  // }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  bool IsSeen(List<String> messgeSeen) {
    for (String key in messgeSeen) {
      if (key.startsWith(uid!)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool isFirst = false;
    return Expanded(
      child: StreamBuilder<List<Message>>(
        stream: ChatCubit.get(context)
            .getChatMessagesGroup(receiverId: widget.receiverId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            if (isOpen) {
              return SizedBox();
            } else {
              return Align(
                alignment: AlignmentDirectional.topCenter,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(top: 15.h),
                  child: CircularProgressIndicator(
                    color: context.colorScheme.secondaryContainer,
                  ),
                ),
              );
            }
          }

          //to scroll  to bottom
          if (isOpen ||
              (ismessageController &&
                  intmessageController < snapshot.data!.length)) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              messageController
                  .jumpTo(messageController.position.maxScrollExtent);
            });
            isOpen = false;
            ismessageController = false;
            intmessageController = snapshot.data!.length;
          }
          return ListView.builder(
            controller: messageController,
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 5),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var cubit = ChatCubit.get(context);
              var message = snapshot.data![snapshot.data!.length - 1 - index];
              ////////////////////////////////////////////
              isFirst = false;
              var priviesMessage =
                  (index > 0) ? snapshot.data![snapshot.data!.length - index] : null;
              //check to make message small bubble for first message
              if (index == 0 ||
                  message.senderId != priviesMessage!.senderId ||
                  !getTime(message.timeSent)
                      .isSameDay(getTime(priviesMessage.timeSent))) {
                isFirst = true;
              }
              /////////////////////////////////////////////
              // set chat messageGroup seen
              if (message.senderId != uid && !IsSeen(message.isSeen)) {
                message.isSeen.add(
                    '${uid!}, ${userEntity.profilePic}, ${userEntity.name}, ${getGlobalTimeLocal()}');
                // ChatCubit.get(context).setChatMessageGroupSeen(
                //   receiverId: widget.receiverId,
                //   messageId: message.messageId,
                //   isSeen: message.isSeen,
                // );
              }
              return BlocConsumer<ChatCubit, ChatState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      if (index == 0 ||
                          !DateConverter.isSameDay(
                            getTime(message.timeSent),
                            getTime(snapshot.data![snapshot.data!.length - index].timeSent),
                          ))
                        ChatTimeCard(dateTime: getTime(message.timeSent)),
                      if (message.senderId == uid)
                       MyMessageCard(
                                    isFirst: isFirst,
                                    isGroup: widget.isGroup,
                                    isReaction: cubit.reactionView,
                                    index: cubit.currentIndex,
                                  ),
                       if (message.senderId != uid)
                        SenderMessageCard(
                                    isGroup: widget.isGroup,
                                    isFirst: isFirst,
                                    isReaction: cubit.reactionView,
                                    index: cubit.currentIndex,
                                  ),
                    ],
                  );
                },
                listener: (context, state) {},
              );
            },
          );
        },
      ),
    );
  }
}
class ChatTimeCard extends StatelessWidget {
  final DateTime dateTime;

  const ChatTimeCard({
    super.key,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        margin: const EdgeInsets.all(5),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          dateTime.chatDayTime,
          style: TextStyle(
              fontSize: 14.spMin),
        ),
      ),
    );
  }
}
