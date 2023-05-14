import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/core/extensions/time_extension.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/domain/entities/contact_chat.dart';
import 'package:online_course/features/presentation/components/contact_profile_pic_dialog.dart';
import 'package:online_course/features/presentation/components/custom_list_tile.dart';
import 'package:online_course/features/presentation/components/my_cached_net_image.dart';
import 'package:online_course/features/presentation/views/chat/chat_screen.dart';

class ChatContactCard extends StatelessWidget {
  final ContactChat chatContact;
  final bool isContacts;

  const ChatContactCard({
    super.key,
    required this.chatContact,
    required this.isContacts,
  });

  @override
  Widget build(BuildContext context) {
    String text = " ";
    // this stream to get num of message not seen

    return Builder(
      builder: (context) {
        if (chatContact.lastMessage == '📷 Photo' ||
            chatContact.lastMessage == '🎥 Video' ||
            chatContact.lastMessage == '🎙️ Audio' ||
            chatContact.lastMessage == 'Gif') {
          text = chatContact.lastMessage;
        } else {
          text = stringToBase64Url.decode(
              "${chatContact.lastMessage.replaceFirst('${chatContact.lastMessage.characters.first}', '').characters.getRange(0, ((chatContact.lastMessage.replaceFirst('${chatContact.lastMessage.characters.first}', '')).length / 2).toInt())}");
        }
        return CustomListTile(
          title: chatContact.name,
          muteNotification: false,
          onTap: () {
            Get.to(ChatScreen(
                name: 'Ahmed',
                uId: 'a',
                receiverPic:
                    'https://firebasestorage.googleapis.com/v0/b/offlinesms-messenger.appspot.com/o/groupPic%2F92b39f10-dedc-11ed-b2ec-f5ac0a22323a?alt=media&token=8cbdbdcf-8850-44bc-b97c-c9b0ed174ac8',
                isGroup: true));
          },
          subTitle: 'Hi Ahmed',
          time: DateTime.now().chatContactTime,
          numOfMessageNotSeen: 5,
          leading: Hero(
            tag: chatContact.couserId,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: () async {
                await showContactProfilePicDialog(
                  context,
                  name: chatContact.name,
                  profilePic: chatContact.profilePic,
                  contactId: chatContact.couserId,
                  isGroup: true,
                );
              },
              child: MyCachedGroup(
                imageUrl: chatContact.profilePic,
                radius: 25.r,
              ),
            ),
          ),
        );
      },
    );
  }
}
