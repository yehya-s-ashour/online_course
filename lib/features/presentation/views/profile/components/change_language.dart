import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/controllers/Setting/SettingCubit.dart';
import 'package:online_course/features/presentation/controllers/Setting/SettingState.dart';
import 'package:online_course/features/presentation/views/main_home_screen/main_home_screen.dart';
import 'package:online_course/features/presentation/views/translate.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  String langValue = userEntity.language != 'Arabic'
      ? Translation.English1
      : Translation.English2;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic'
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: BlocConsumer<SettingCubit, SettingState>(
        builder: (context, state) {
          return Scaffold(
            // appBar: MyAppBar(title: "Language"),
            appBar: MyAppBar(
              title: userEntity.language != 'Arabic'
                  ? Translation.Language1
                  : Translation.Language2,
              backgroundColor: kPrimaryColor,
              color: Colors.white,
              titleColor: Colors.white,
            ),
            body: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      userEntity.language != 'Arabic'
                          ? Translation.Choose_Your_Language1
                          : Translation.Choose_Your_Language2,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(height: Get.height * 0.05),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButton(
                        focusColor: Colors.white,
                        icon: const Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Icon(Icons.keyboard_arrow_down_rounded)),
                        value: langValue,
                        isExpanded: true,
                        style:
                            const TextStyle(fontSize: 15, color: Colors.black),
                        underline: const Divider(color: Colors.white),
                        items: [
                          DropdownMenuItem(
                            value: userEntity.language != 'Arabic'
                                ? Translation.English1
                                : Translation.English2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.flag),
                                  SizedBox(width: Get.width * 0.01),
                                  Text(userEntity.language != 'Arabic'
                                      ? Translation.English1
                                      : Translation.English2),
                                ],
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: userEntity.language != 'Arabic'
                                ? Translation.Arabic1
                                : Translation.Arabic2,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Row(
                                children: [
                                  const Icon(Icons.flag),
                                  SizedBox(width: Get.width * 0.01),
                                  Text(userEntity.language != 'Arabic'
                                      ? Translation.Arabic1
                                      : Translation.Arabic2),
                                ],
                              ),
                            ),
                          )
                        ].toList(),
                        onChanged: (value) {
                          setState(() {
                            print(value);
                            langValue = value!;
                          });
                        },
                      )),
                  SizedBox(height: Get.height * 0.06),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              SettingCubit.get(context)
                                  .changeLanguage(languageOut: langValue);
                              Get.to(MainHomeScreen());
                            },
                            style: ButtonStyle(
                                foregroundColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                elevation: const MaterialStatePropertyAll(0),
                                minimumSize: MaterialStatePropertyAll(
                                    Size(Get.width * 0.2, Get.height * .06)),
                                maximumSize: MaterialStatePropertyAll(
                                    Size(Get.width * 0.7, Get.height * .06)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(13))),
                                side: const MaterialStatePropertyAll(
                                    BorderSide(color: Colors.white))),
                            child: Text(userEntity.language != 'Arabic'
                                ? Translation.Confirm1
                                : Translation.Confirm2)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
