import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:online_course/features/presentation/components/my_cached_net_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String receiverId;
  final String receiverPic;
  final bool isGroup;

  const ChatAppBar({
    super.key,
    required this.name,
    required this.receiverId,
    required this.receiverPic,
    required this.isGroup,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 70,
      titleSpacing: 0,
      leading: Container(
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () {
            Get.back();
          },
          child: Row(
            children: [
              const Icon(Icons.arrow_back_rounded),
              Hero(
                tag: 'asw',
                child: MyCachedGroup(
                  imageUrl: receiverPic,
                  radius: 23.r,
                ),
              ),
            ],
          ),
        ),
      ),
      title: SizedBox(
        width: double.infinity,
        height: kToolbarHeight,
        child: InkWell(
          onTap: () {
            // Navigator.of(context).pushNamed(
            //   Routes.senderUserProfileRoute,
            //   arguments: userdata,
            // );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10),
                  child: Text(name),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
// bool getInMe() {
//   for (int i = 0; i < userData!.membersUid.length; i++) {
//     if (userData!.membersUid[i].startsWith('{uId: ${userEntity!.uId}')) {
//       return true;
//     }
//   }
//   return false;
// }
