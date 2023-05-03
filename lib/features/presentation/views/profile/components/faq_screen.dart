import 'package:flutter/material.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';


class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title: "",backgroundColor:kPrimaryColor ,color: Colors.white,titleColor: Colors.white,),
        body: SingleChildScrollView(
          child: Container(
            padding:const EdgeInsets.only(top: 10,left: 15,right: 15,bottom: 10),
            child: Column(
              children: const [
                Text(
                  "FAQ",
                  style: TextStyle(
                      color: Color(0xFF202244),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40,),
                ExpansionTile(
                  backgroundColor: Color(0xFFCCCCFF),
                  title: Text(
                    "What is Perkz Dollar?",
                    style: TextStyle(color: Color(0xFF202244),
                    ),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        "Perkz Dollar is the currency used in this app.\n It can be used to purchase items in the marketplace. \nYou can get it free by completing your profile or refering your friends.",
                        style: TextStyle(color: Color(0xFF202244)),),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                ExpansionTile(
                  title: Text(
                    "What is Benefits?",
                    style: TextStyle(color: Color(0xFF202244)),
                  ),
                  backgroundColor: Color(0xFFCCCCFF),
                  children: [
                    ListTile(
                      title: Text(
                        "Perkz Dollar is the currency used in this app. \n It can be used to purchase items in the marketplace.\n  You can get it free by completing your profile or refering your friends.",style: TextStyle(color: Color(0xFF202244)),),

                    )
                  ],
                ),
                SizedBox(height: 10,),
                ExpansionTile(
                  title: Text(
                    "How do I make purchases with Perkz and Benefits?",
                    style: TextStyle(color: Color(0xFF202244)),
                  ),
                  backgroundColor: Color(0xFFCCCCFF),
                  children: [
                    ListTile(
                      title: Text(
                        "Perkz Dollar is the currency used in this app.\n It can be used to purchase items in the marketplace.\n You can get it free by completing your profile or refering your friends.",style: TextStyle(color: Color(0xFF202244)),),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                ExpansionTile(
                  title: Text(
                    "How do I make purchases with credit card?",
                    style: TextStyle(color: Color(0xFF202244)),
                  ),
                  backgroundColor: Color(0xFFCCCCFF),
                  children: [
                    ListTile(
                      title: Text(
                        "Perkz Dollar is the currency used in this app.\n It can be used to purchase items in the marketplace.\n You can get it free by completing your profile or refering your friends.",style: TextStyle(color: Color(0xFF202244)),),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                ExpansionTile(
                  title: Text(
                    "‏How can I get more Perkz?",
                    style: TextStyle(color: Color(0xFF202244)),
                  ),
                  backgroundColor:Color(0xFFCCCCFF),
                  children: [
                    ListTile(
                      title: Text(
                        "Perkz Dollar is the currency used in this app.\n It can be used to purchase items in the marketplace. \nYou can get it free by completing your profile or refering your friends.",style: TextStyle(color: Color(0xFF202244)),),
                    )
                  ],
                ),
                SizedBox(height: 10,),

              ],
            ),
          ),
        ));
  }
}
