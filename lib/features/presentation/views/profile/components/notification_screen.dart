import 'package:flutter/material.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';


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
    return Scaffold(
      appBar: MyAppBar(title: "Notification Setting",backgroundColor:kPrimaryColor ,color: Colors.white,titleColor: Colors.white,),
      body: ListView(
        children: [



          ListTile(  title: const Text('show notification',style: TextStyle(color: Color(0xFF202244)),),
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
          ListTile(  title: const Text('show app icon dabges',style: TextStyle(color: Color(0xFF202244))),
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
          ListTile(  title: const Text('Floating notification',style: TextStyle(color: Color(0xFF202244))),
            subtitle: const Text("Allow floating notification"),
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
          ListTile(  title: const Text('Lock screen notification',style: TextStyle(color: Color(0xFF202244))),
            subtitle: const Text("Allow notification on the lock screen"),
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
          ListTile(  title: const Text('Allow sound',style: TextStyle(color: Color(0xFF202244))),
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
          ListTile(  title: const Text('Allow vibation',style: TextStyle(color: Color(0xFF202244))),
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
          ListTile(  title: const Text('Allow using LED light',style: TextStyle(color: Color(0xFF202244))),
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
    );
  }
}
