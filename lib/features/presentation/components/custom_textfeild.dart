

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../Theme/styles/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final IconData ?iconData;
  final String ?text;
  final EdgeInsetsGeometry? padding;
  final TextInputAction? inputAction;
  final Function(String) ?onChange;
  final String ?initialValue;
  final bool ?requirement;
  final     String?   Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final int maxLine;
  final int ?maxLength;
  final int ?minLine;
  final double? mElev;
  final TextInputType ?textInputType;


  final Widget ?inkell;
  final bool isHidden ;
  final bool read ;
  final Color? shadowColor;
  String? _errorMessage(bool str) {
    switch (str) {
      case true:
        return 'This filed requirement'.tr;

    }
  }

  TextFieldWidget({
    Key ?key,
    this.hint,
    this.controller,
    this.iconData,
    this.text, this.inkell, this.isHidden=false, this.initialValue, this.requirement, this.maxLine=1, this.minLine, this.textInputType, this.onChange, this.read=false, this.maxLength, this.inputAction, this.validator, this.autovalidateMode, this.padding, this.mElev, this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding?? EdgeInsets.only(top: 0.03.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          Material(
            borderRadius: BorderRadius.circular(10.r),
            elevation:mElev?? 13 ,
            color: Colors.transparent,
            shadowColor:shadowColor?? kWhiteColor.withOpacity(0.3),

            child: TextFormField(
              autovalidateMode:autovalidateMode ,
              maxLength:maxLength ,
           readOnly: read,
              initialValue: initialValue,

              controller: controller,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(color: kDBackGColor),

              validator: validator??  (value) {
                if (value!.isEmpty) {
                  //print('error'+error);
                  return _errorMessage(requirement!);
                  // ignore: missing_return
                }
              },
              cursorColor: kPrimaryColor,
              obscureText: isHidden,
              textInputAction: inputAction,
              //textAlign: TextAlign.center,
              keyboardType:textInputType?? TextInputType.text,
              autocorrect: false,
              maxLines: maxLine,
              minLines: minLine,onChanged: onChange,
              decoration: InputDecoration(hintText: hint,

                  filled: true,
                  fillColor:  kLightBgColor.withOpacity(.8),
                  errorMaxLines: 1,
                  label:  Text.rich(  TextSpan(children: [
                    if(hint!=null&&text==null)
                      TextSpan(text:hint!,style:Theme.of(context).textTheme.subtitle1),
                    if(text!=null)
                      TextSpan(text:text!,style:Theme.of(context).textTheme.subtitle1),
                    if(requirement==true)
                      TextSpan(text:'*',style: Theme.of(context).textTheme.headline6!.copyWith(color: kRedColor),)

                  ] ),
                    // text!,
                    // style: Theme.of(context).textTheme.headline4

                  ) ,
                  hintStyle: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  errorBorder: OutlineInputBorder(
                      gapPadding: 0,
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color: Colors.transparent)),
//                 suffixIcon: text=='Password'.tr?Icon(Icons.remove_red_eye_outlined,color:kColorsBackground,size: .03.sh,):SizedBox(),

                  suffixIcon: inkell ?? const SizedBox(),
                  prefixIcon:iconData==null?null: Icon(

                    iconData,
                    color: kPrimaryColor,
                    size: 25.r,
                  )
              ),
            ),
          ),

        ],
      ),
    );
  }
}