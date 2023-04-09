import 'package:flutter/material.dart';

import '../../components/cutom_appbar.dart';
import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Let's Sign Up" ,),
      body: const Body(),
    );
  }
}
