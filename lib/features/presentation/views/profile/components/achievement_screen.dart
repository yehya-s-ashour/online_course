import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class AchievementScreen extends StatefulWidget {
  const AchievementScreen({Key? key}) : super(key: key);

  @override
  State<AchievementScreen> createState() => _AchievementScreenState();
}

class _AchievementScreenState extends State<AchievementScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        appBar: MyAppBar(
          title: userEntity.language == 'Arabic'
              ? Translation.Achievements2
              : Translation.Achievements1,
          backgroundColor: kPrimaryColor,
          color: Colors.white,
          titleColor: Colors.white,
        ),
        body: Center(
          child: SizedBox(
            width: 250,
            child: Text(
              userEntity.language == 'Arabic'
                  ? "ليس لديك أي إنجازات بعد"
                  : "You Don't Have Any Achievements Yet",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: mixedColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
