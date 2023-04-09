import 'package:flutter/material.dart';
import 'package:online_course/components/cutom_appbar.dart';


import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppBar(title: 'OTP Verification',),
      body: const Body(),
    );
  }
}
