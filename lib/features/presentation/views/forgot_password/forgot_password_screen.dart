import 'package:flutter/material.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/translate.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,

      child: Scaffold(
        appBar: MyAppBar(
          title: userEntity.language != 'Arabic' ? Translation.Forget_Password1 :Translation.Forget_Password2,
        ),
        body: const Body(),
      ),
    );
  }
}
