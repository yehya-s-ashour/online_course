import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/generated/assets.dart';
class CustomListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String? subTitle;
  final String? time;
  final Widget? titleButton;
  final int numOfMessageNotSeen;
  final VoidCallback onTap;
  final VoidCallback? onLeadingTap;
  bool muteNotification;

  CustomListTile({
    super.key,
    this.leading,
    required this.title,
    this.subTitle,
    this.time,
    this.numOfMessageNotSeen = 0,
    this.titleButton,
    required this.onTap,
    this.onLeadingTap,
    this.muteNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading ??
          InkWell(
            onTap: onLeadingTap,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: Image.asset(Assets.assetsSplash1),
            ),
          ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              //style: context.headlineSmall,
              style: GoogleFonts.cairo(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          if (time != null)
            Text(
              time!,
              style: numOfMessageNotSeen>0
                  ? GoogleFonts.cairo(color: mixedColor!,fontSize: 16)
                  : GoogleFonts.cairo(color: mixedColor!,fontSize: 16),
            ),
          if (titleButton != null)
            SizedBox(
              height: 40,
              child: titleButton!,
            ),
        ],
      ),
      subtitle: subTitle != null
          ? Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Row(
                children: [
                  //Icon(Icons.done_all,size: 20,),
                  Expanded(
                    child: Text(
                      subTitle!,
                      style: GoogleFonts.cairo(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  if(muteNotification)
                    Icon(
                      Icons.volume_off,
                      color: Colors.grey.shade500,
                    ),
                  if(numOfMessageNotSeen > 0)
                  SizedBox(
                    width: 10.w,
                  ),
                  if (numOfMessageNotSeen > 0)
                    CircleAvatar(
                      minRadius: 12,
                      // backgroundColor: context.colorScheme.onPrimaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          numOfMessageNotSeen.toString(),
                          style: GoogleFonts.cairo(),
                        ),
                      ),
                    ),
                ],
              ),
            )
          : null,
    );
  }
}
