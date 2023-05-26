import 'package:flutter/material.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/translate.dart';


class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}
// 1)
// 2) How do I download and install the App?
// You can download and install the Learnify app from the Google Play Store.
// Simply search for the app and follow the instructions provided.
// 3) What courses are available on the Learnify App?
//
// 4) Are there any prerequisites for taking the courses?
//
class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
          appBar: MyAppBar(title: "",backgroundColor:kPrimaryColor ,color: Colors.white,titleColor: Colors.white,),
          body: SingleChildScrollView(
            child: Container(
              padding:const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 10),
              child: Column(
                children:  [
                  Text(
                    userEntity.language != 'Arabic' ? Translation.FAQ1 :Translation.FAQ2,
                    style: TextStyle(
                        color: Color(0xFF202244),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40,),
                  ExpansionTile(
                    backgroundColor: Color(0xFFCCCCFF),
                    title: Text(
                      "What is the Learnify app all about? ",
                      style: TextStyle(color: Color(0xFF202244),
                      ),
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          "The Learnify app is an online platform that offers various courses for students to learn and acquire new skills through the use of technology.",
                          style: TextStyle(color: Color(0xFF202244)),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  ExpansionTile(
                    title: Text(
                      "How do I download and install the App?",
                      style: TextStyle(color: Color(0xFF202244)),
                    ),
                    backgroundColor: Color(0xFFCCCCFF),
                    children: [
                      ListTile(
                        title: Text(
                          "You can download and install the Learnify app from the Google Play Store. \nSimply search for the app and follow the instructions provided.",style: TextStyle(color: Color(0xFF202244)),),

                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  ExpansionTile(
                    title: Text(
                      "What courses are available on the Learnify App?",
                      style: TextStyle(color: Color(0xFF202244)),
                    ),
                    backgroundColor: Color(0xFFCCCCFF),
                    children: [
                      ListTile(
                        title: Text(
                          "The courses available on the Learnify app may vary, but generally, there are \ncourses on a wide range of subjects such as language learning, computer \nprogramming, business management, and more.",style: TextStyle(color: Color(0xFF202244)),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  ExpansionTile(
                    title: Text(
                      "Are there any prerequisites for taking the courses?",
                      style: TextStyle(color: Color(0xFF202244)),
                    ),
                    backgroundColor: Color(0xFFCCCCFF),
                    children: [
                      ListTile(
                        title: Text(
                          "It depends on the course. Some courses may require prior knowledge or skills, \nwhile others are designedforbeginners.",style: TextStyle(color: Color(0xFF202244)),),
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  // ExpansionTile(
                  //   title: Text(
                  //     "‏How can I get more Perkz?",
                  //     style: TextStyle(color: Color(0xFF202244)),
                  //   ),
                  //   backgroundColor:Color(0xFFCCCCFF),
                  //   children: [
                  //     ListTile(
                  //       title: Text(
                  //         "Perkz Dollar is the currency used in this app.\n It can be used to purchase items in the marketplace. \nYou can get it free by completing your profile or refering your friends.",style: TextStyle(color: Color(0xFF202244)),),
                  //     )
                  //   ],
                  // ),
                  SizedBox(height: 10,),

                ],
              ),
            ),
          )),
    );
  }
}
