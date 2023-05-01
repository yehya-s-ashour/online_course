import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/core/network/cache_helper.dart';

DateTime getTime(int time) {
  DateTime dateTimeUct =
      Timestamp(time+sub[0], 0).toDate();
  return dateTimeUct.toLocal();
}

int getGlobalTimeLocal() {
  Timestamp timestamp = Timestamp.now();
  int time =timestamp.seconds - sub[0];

  // String time =
  //     '${timestamp.seconds - sub[0]},${timestamp.nanoseconds - sub[1]}';
  return time;
}

Future<void> getSubTime() async {
  late Timestamp timestamp;
  String time = '';
  await http
      .get(Uri.parse('http://worldtimeapi.org/api/timezone/Etc/GMT'))
      .then((value) async {
    timestamp = Timestamp.now();
    if (value.statusCode == 200) {
      final data = jsonDecode(value.body);
      time = await data['datetime'];
      List<String> year_monthAndday = time.split('-');
      List<String> dayAndhour = year_monthAndday[2].split('T');
      List<String> hourAndminute = dayAndhour[1].split(':');
      String second = hourAndminute[2].split('.')[0];
      DateTime dateTimeUct = DateTime.utc(
          int.parse(year_monthAndday[0]),
          int.parse(year_monthAndday[1]),
          int.parse(dayAndhour[0]),
          int.parse(hourAndminute[0]),
          int.parse(hourAndminute[1]),
          int.parse(second));
      Timestamp.fromDate(dateTimeUct.toLocal());
      sub = [
        timestamp.seconds - Timestamp.fromDate(dateTimeUct.toLocal()).seconds,
        timestamp.nanoseconds -
            Timestamp.fromDate(dateTimeUct.toLocal()).nanoseconds
      ];
      CacheHelper.saveData(key: 'sub', value: sub);

    }
  }).catchError((e) {
   if( CacheHelper.getData(key: 'sub')!=null){
     sub=CacheHelper.getData(key: 'sub');
   }else{
     sub=[0,0];
   }
  });
}
