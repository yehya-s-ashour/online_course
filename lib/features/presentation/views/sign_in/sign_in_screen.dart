import 'package:flutter/material.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/translate.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
        appBar: MyAppBar(
          title:userEntity.language != 'Arabic' ? Translation.Let_Sign_in1 :Translation.Let_Sign_in2,
        ),
        body: const Body(),
      ),
    );
  }
}
