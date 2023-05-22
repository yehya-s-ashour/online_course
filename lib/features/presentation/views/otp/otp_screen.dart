import 'package:flutter/material.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/translate.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
        appBar: MyAppBar(
          title: userEntity.language == 'Arabic' ? Translation.OTP_Verification1 :Translation.OTP_Verification2,
        ),
        body: const Body(),
      ),
    );
  }
}
