import 'package:flutter/material.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/views/translate.dart';

import '../../components/cutom_appbar.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
        appBar: MyAppBar(title:userEntity.language == 'Arabic' ? Translation.Let_Sign_up1 :Translation.Let_Sign_up2,
        ),
        body: const Body(),
      ),
    );
  }
}
