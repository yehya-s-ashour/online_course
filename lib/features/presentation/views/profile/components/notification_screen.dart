import 'package:flutter/material.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/translate.dart';


class  NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool toggleValue = false;
  bool toggleValue1 = true;
  bool toggleValue2 = true;
  bool toggleValue3 = false;
  bool toggleValue4 = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: userEntity.language == 'Arabic' ? TextDirection.rtl: TextDirection.ltr,
      child: Scaffold(
        appBar: MyAppBar(title: userEntity.language == 'Arabic' ? Translation.Notifications_Setting1 :Translation.Notifications_Setting2,backgroundColor:kPrimaryColor ,color: Colors.white,titleColor: Colors.white,),
        body: ListView(
          children: [
            ListTile(  title: Text(userEntity.language == 'Arabic' ? Translation.show_notification1 :Translation.show_notification2,style: TextStyle(color: Color(0xFF202244)),),
              trailing: Switch(
                value: toggleValue,
                onChanged: (value) {
                  setState(() {
                    toggleValue = value;
                  });
                },
              ),),
            const Divider(color: Colors.black12),
            const SizedBox(height: 10,),
            const SizedBox(height: 10,),
            ListTile(  title: Text(userEntity.language == 'Arabic' ? Translation.show_app_icon_badges1 :Translation.show_app_icon_badges2,style: TextStyle(color: Color(0xFF202244))),
              trailing: Switch(
                value: toggleValue1,
                onChanged: (value) {
                  setState(() {
                    toggleValue1 = value;
                  });
                },
              ),),
            const SizedBox(height: 10,),
            const SizedBox(height: 10,),
            ListTile(  title: Text(userEntity.language == 'Arabic' ? Translation.Floating_notification1 :Translation.Floating_notification2,style: TextStyle(color: Color(0xFF202244))),
              subtitle: Text(userEntity.language == 'Arabic' ? Translation.Allow_floating_notification1 :Translation.Allow_floating_notification2,),
              trailing: Switch(
                value: toggleValue2,
                onChanged: (value) {
                  setState(() {
                    toggleValue2 = value;
                  });
                },
              ),),
            const SizedBox(height: 10,),
            const SizedBox(height: 10,),
            ListTile(  title: Text(userEntity.language == 'Arabic' ? Translation.Lock_screen_notification1 :Translation.Lock_screen_notification2,style: TextStyle(color: Color(0xFF202244))),
              subtitle: Text(userEntity.language == 'Arabic' ? Translation.Allow_notification_on_the_lock_screen1 :Translation.Allow_notification_on_the_lock_screen2,),
              trailing: Switch(
                value: toggleValue3,
                onChanged: (value) {
                  setState(() {
                    toggleValue3 = value;
                  });
                },
              ),),
            const SizedBox(height: 10,),
            const SizedBox(height: 10,),
            ListTile(  title: Text(userEntity.language == 'Arabic' ? Translation.Allow_sound1 :Translation.Allow_sound2,style: TextStyle(color: Color(0xFF202244))),
              trailing: Switch(
                value: toggleValue4,
                onChanged: (value) {
                  setState(() {
                    toggleValue4 = value;
                  });
                },
              ),),
            const SizedBox(height: 10,),
            const SizedBox(height: 10,),
            ListTile(  title: Text(userEntity.language == 'Arabic' ? Translation.Allow_vibation1 :Translation.Allow_vibation2,style: TextStyle(color: Color(0xFF202244))),
              trailing: Switch(
                value: toggleValue4,
                onChanged: (value) {
                  setState(() {
                    toggleValue4 = value;
                  });
                },
              ),),
            const SizedBox(height: 10,),
            const SizedBox(height: 10,),
            ListTile(  title: Text(userEntity.language == 'Arabic' ? Translation.Allow_using_LED_light1 :Translation.Allow_using_LED_light2,style: TextStyle(color: Color(0xFF202244))),
              trailing: Switch(activeColor: Colors.blueAccent,
                value: toggleValue4,
                onChanged: (value) {
                  setState(() {
                    toggleValue4 = value;
                  });
                },
              ),),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
