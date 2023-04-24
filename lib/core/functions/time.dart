import 'dart:convert';
import 'package:http/http.dart' as http;

DateTime getTime(String time) {

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

  return dateTimeUct.toLocal();
}

Future<String> getGlobalTimeLocal() async {
  String time = '';
  await http
      .get(Uri.parse('http://worldtimeapi.org/api/timezone/Etc/GMT'))
      .then((value) {
    if (value.statusCode == 200) {
      final data = jsonDecode(value.body);
      time = data['datetime'];
    }
  }).catchError((e) {
    DateTime dateTime = DateTime.now();
    time =
        '${dateTime.year}-${dateTime.month}-${dateTime.day}T${dateTime.hour}:${dateTime.minute}:${dateTime.second}.${dateTime.millisecond}+00:00';
  });
  return time;
}
