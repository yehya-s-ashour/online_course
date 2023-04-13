import 'package:flutter/material.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';

import 'components/body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Forget Password",
      ),
      body: const Body(),
    );
  }
}
