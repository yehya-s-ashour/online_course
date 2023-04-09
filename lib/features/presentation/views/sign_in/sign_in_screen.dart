import 'package:flutter/material.dart';
import 'package:online_course/components/cutom_appbar.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Let's Sign in" ,),
      body: const Body(),
    );
  }
}
