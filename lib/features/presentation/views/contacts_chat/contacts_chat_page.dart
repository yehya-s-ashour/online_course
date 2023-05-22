import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/extensions/extensions.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/functions/time.dart';
import 'package:online_course/features/data/models/contact_chat_model.dart';
import 'package:online_course/features/domain/entities/contact_chat.dart';
import 'package:online_course/features/presentation/controllers/chat_cubit/chat_cubit.dart';

import 'components/chat_contact_card.dart';

class ContactsChatPage extends StatelessWidget {
  const ContactsChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
          body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 15.w, top: 35.h, bottom: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userEntity.language == 'Arabic' ? "رسالة" : 'Message',
                    style: GoogleFonts.cairo(
                        fontSize: 20.spMin, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w, end: 10.w),
              child: SizedBox(
                width: 330.w,
                height: 40.h,
                child: TextFormField(
                  onTap: () {},
                  showCursor: true,
                  readOnly: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: BorderSide(
                        color: Color(0xff463bce),
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 26.spMin,
                    ),
                    suffixIcon: Container(
                      width: 10.w,
                      height: 10.h,
                      margin: EdgeInsetsDirectional.only(
                          end: 4.w, top: 3.h, bottom: 3.h),
                      decoration: BoxDecoration(
                        color: Color(0xff463bce),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Icon(
                        Icons.mic,
                        color: Colors.white,
                        size: 28.spMin,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: userEntity.language == 'Arabic'
                        ? "البحث في الكورسات"
                        : "Search in courses",
                    labelStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Color.fromARGB(255, 242, 240, 240),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    isDense: true,
                  ),
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<ContactChatModel>>(
                stream: ChatCubit.get(context).getContactChat(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: snapshot.data!.length,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatContactCard(
                        chatContact: ContactChat(
                          instractorName: snapshot.data![index].instractorName,
                          name: snapshot.data![index].name,
                          profilePic: snapshot.data![index].profilePic,
                          couserId: snapshot.data![index].couserId,
                          lastMessage: snapshot.data![index].lastMessage,
                          timeSent: snapshot.data![index].timeSent,
                        ),
                        isContacts: true,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
    // return )
  }
}
