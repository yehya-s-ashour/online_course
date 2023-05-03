import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  String langValue = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar(title: "Language"),
      appBar: MyAppBar(title: "Language",backgroundColor:kPrimaryColor ,color: Colors.white,titleColor: Colors.white,),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Choose Your Language',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
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
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                  underline: const Divider(color: Colors.white),
                  items: [
                    DropdownMenuItem(
                      value: 'English',
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            const Icon(Icons.flag),
                            SizedBox(width: Get.width * 0.01),
                            const Text('English'),
                          ],
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'Arabic',
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: [
                            const Icon(Icons.flag),
                            SizedBox(width: Get.width * 0.01),
                            const Text('Arabic'),
                          ],
                        ),
                      ),
                    )
                  ].toList(),
                  onChanged: (value) {
                    setState(() {
                      langValue = value!;
                    });
                  },
                )),
            SizedBox(height: Get.height * 0.06),
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                          MaterialStatePropertyAll(Colors.black26),
                          elevation: MaterialStatePropertyAll(0),
                          minimumSize: MaterialStatePropertyAll(
                              Size(Get.width * 0.2, Get.height * .06)),
                          maximumSize: MaterialStatePropertyAll(
                              Size(Get.width * 0.7, Get.height * .06)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
                          side: const MaterialStatePropertyAll(
                              BorderSide(color: Colors.black12))),
                      child: const Text('Cancel')),
                  SizedBox(width: Get.width * 0.05),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          // backgroundColor:
                          // const MaterialStatePropertyAll(Colors.greenAccent),
                          foregroundColor:
                          const MaterialStatePropertyAll(Colors.white),
                          elevation: const MaterialStatePropertyAll(0),
                          minimumSize: MaterialStatePropertyAll(
                              Size(Get.width * 0.2, Get.height * .06)),
                          maximumSize: MaterialStatePropertyAll(
                              Size(Get.width * 0.7, Get.height * .06)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13))),
                          side: const MaterialStatePropertyAll(
                              BorderSide(color: Colors.white))),
                      child: const Text('Confirm')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
