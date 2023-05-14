import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/functions/time.dart';
import 'package:online_course/features/domain/entities/contact_chat.dart';
import 'package:online_course/features/presentation/controllers/chat_cubit/chat_cubit.dart';

import 'components/chat_contact_card.dart';

class ContactsChatPage extends StatelessWidget {
  const ContactsChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
      children: [
          Padding(
            padding:
                EdgeInsetsDirectional.only(start: 15.w, top: 35.h, bottom: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Message',
                  style: GoogleFonts.cairo(
                      fontSize: 20.spMin, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 10.w,end: 10.w),
            child: SizedBox(
              width: 330.w,
              height: 40.h,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 23,
                  ),
                  // suffixIcon: Container(
                  //   decoration: BoxDecoration(
                  //     color: Color(0xff463bce),
                  //     border: Border.all(
                  //         color: Color.fromARGB(255, 236, 234, 234), width: 4.0.w),
                  //     borderRadius: BorderRadius.circular(15.r),
                  //   ),
                  //   child: Icon(
                  //     Icons.mic,
                  //     color: Colors.white,
                  //     size: 28.spMin,
                  //   ),
                  // ),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  labelText: "Search in courses",
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  isDense: true,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: 25,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ChatContactCard(
                  chatContact: ContactChat(
                    instractorName: 'Yousef',
                    name: 'Html',
                    profilePic:
                        'https://firebasestorage.googleapis.com/v0/b/ilearn-app-1181f.appspot.com/o/Business%2FCommunications%2FValue%20Centric%20Selling%20-%20How%20to%20Sell%20on%20Value%2C%20Not%20Price%2F1.png?alt=media&token=daf5c9f5-22e3-4c6e-ba4c-b63d3ad2d270',
                    couserId: 'aaaaaaaaa',
                    lastMessage: 'Hi',
                    timeSent: getGlobalTimeLocal(),
                  ),
                  isContacts: true,
                );
              },
            ),
            // child: StreamBuilder<List<ContactChat>>(
            //   stream: ChatCubit.get(context).getContactsChat({}),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //
            //       if (chatContactAll.length > 0)
            //         return ListView.builder(
            //           padding: const EdgeInsets.only(top: 10),
            //           itemCount: chatContactAll.length,
            //           shrinkWrap: true,
            //           physics: const BouncingScrollPhysics(),
            //           itemBuilder: (context, index) {
            //             List<String> ContactChatIndex = chatContactAll[index]
            //                 .replaceFirst('{', '')
            //                 .replaceFirst('}', '')
            //                 .split(', ');
            //
            //             return ChatContactCard(
            //               chatContact: ContactChat(
            //                 name: ContactChatIndex[0].split(': ')[1],
            //                 profilePic: ContactChatIndex[1].split(': ')[1],
            //                 contactId: ContactChatIndex[2].split(': ')[1],
            //                 lastMessage: ContactChatIndex[3].split(': ')[1],
            //                 timeSent: ContactChatIndex[4].split(': ')[1],
            //                 phoneNumber: ContactChatIndex[5].split(': ')[1],
            //                 isGroup: ContactChatIndex[6].split(': ')[1] == 'false' ? false : true,
            //                 muteNotification:  ContactChatIndex[7].split(': ')[1] == 'false' ? false : true ,
            //               ),
            //               isContacts: false,
            //             );
            //           },
            //         );
            //       return SizedBox();
            //     }
            //     return ListView.builder(
            //       padding: const EdgeInsets.only(top: 10),
            //       itemCount: snapshot.data!.length,
            //       shrinkWrap: true,
            //       physics: const BouncingScrollPhysics(),
            //       itemBuilder: (context, index) {
            //         return ChatContactCard(
            //           chatContact: snapshot.data![index],
            //           isContacts: true,
            //         );
            //       },
            //     );
            //   },
            // ),
          ),
      ],
    ),
        ));
    // return )
  }
}
