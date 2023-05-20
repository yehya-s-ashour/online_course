import 'package:cloud_firestore/cloud_firestore.dart';

DateTime getTime(int time) {
  DateTime dateTimeUct = Timestamp(time, 0).toDate();
  return dateTimeUct.toLocal();
}

int getGlobalTimeLocal() {
  Timestamp timestamp = Timestamp.now();
  int time = timestamp.seconds;
  return time;
}
