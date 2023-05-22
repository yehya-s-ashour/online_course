import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/translate.dart';


class ChooseCredentials extends StatefulWidget {
  ChooseCredentials({Key? key}) : super(key: key);

  @override
  State<ChooseCredentials> createState() => _ChooseCredentialsState();
}

class _ChooseCredentialsState extends State<ChooseCredentials> {
  String langValue = userEntity.language == 'Arabic' ? Translation.Bachelor1 :Translation.Bachelor2;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
        appBar: MyAppBar(title: userEntity.language == 'Arabic' ? Translation.Credentials1 :Translation.Credentials2,backgroundColor:kPrimaryColor ,color: Colors.white,titleColor: Colors.white,),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(userEntity.language == 'Arabic' ? Translation.Choose_Your_Credentials1 :Translation.Choose_Your_Credentials2,
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
                        value: userEntity.language == 'Arabic' ? Translation.Bachelor1 :Translation.Bachelor2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              const Icon(Icons.flag),
                              SizedBox(width: Get.width * 0.01),
                               Text(userEntity.language == 'Arabic' ? Translation.Bachelor1 :Translation.Bachelor2),
                            ],
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: userEntity.language == 'Arabic' ? Translation.Master1 :Translation.Master2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              const Icon(Icons.flag),
                              SizedBox(width: Get.width * 0.01),
                               Text(userEntity.language == 'Arabic' ? Translation.Master1 :Translation.Master1,),
                            ],
                          ),
                        ),
                      ),      DropdownMenuItem(
                        value: userEntity.language == 'Arabic' ? Translation.Doctor1 :Translation.Doctor2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Row(
                            children: [
                              const Icon(Icons.flag),
                              SizedBox(width: Get.width * 0.01),
                               Text(userEntity.language == 'Arabic' ? Translation.Doctor1 :Translation.Doctor2,),
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
                            const MaterialStatePropertyAll(Colors.white),
                            foregroundColor:
                            const MaterialStatePropertyAll(Colors.black26),
                            elevation: const MaterialStatePropertyAll(0),
                            minimumSize: MaterialStatePropertyAll(
                                Size(Get.width * 0.2, Get.height * .06)),
                            maximumSize: MaterialStatePropertyAll(
                                Size(Get.width * 0.7, Get.height * .06)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13))),
                            side: const MaterialStatePropertyAll(
                                BorderSide(color: Colors.black12))),
                        child:  Text(userEntity.language == 'Arabic' ? Translation.Cancel1 :Translation.Cancel2,)),
                    SizedBox(width: Get.width * 0.05),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(

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
                        child:  Text(userEntity.language == 'Arabic' ? Translation.Confirm1 :Translation.Confirm2,)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
