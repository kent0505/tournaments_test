import 'dart:developer' as developer;

import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'tour.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

String timestampToString(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat('dd.MM.yyyy').format(date);
}

String dateToString(DateTime date) {
  return DateFormat('dd.MM.yyyy').format(date);
}

String timeToString(DateTime time) {
  return DateFormat('HH:mm').format(time);
}

DateTime stringToDate(String date) {
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    logger(e);
    return DateTime.now();
  }
}

void logger(Object message) => developer.log(message.toString());

Future<void> initDB() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('tournaments_box');
  Hive.registerAdapter(TourAdapter());
}

Future<List<Tour>> getTours() async {
  final box = await Hive.openBox('tournaments_box');
  List data = await box.get('tours') ?? [];
  return data.cast<Tour>();
}

Future<List<Tour>> updateTours(List<Tour> tours) async {
  final box = await Hive.openBox('tournaments_box');
  await box.put('tours', tours);
  return await box.get('tours');
}
