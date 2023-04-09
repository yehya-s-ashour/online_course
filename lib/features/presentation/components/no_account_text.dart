import 'package:flutter/material.dart';
import 'package:online_course/constants.dart';

import '../Theme/styles/colors.dart';



class NoAccountText extends StatelessWidget {
  final String text,goTitle;
  final Function()? onTapTitle;
  const NoAccountText({
    Key? key, required this.text, required this.goTitle, this.onTapTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          text,

        ),
        GestureDetector(
          onTap: onTapTitle,
          child:  Text(
           goTitle,style: Theme.of(context).textTheme.subtitle2!.copyWith(color: kPrimaryColor),

          ),
        ),
      ],
    );
  }
}
