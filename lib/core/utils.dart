import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'participant.dart';
import 'tour.dart';

int getTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String formatTimestamp(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  return DateFormat("d MMMM yyyy").format(date);
}

List<Tour> toursList = [];

Future<void> getTours() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('tournaments_box');
  Hive.registerAdapter(TourAdapter());
  Hive.registerAdapter(ParticipantAdapter());
  final box = await Hive.openBox('tournaments_box');
  List data = await box.get('toursList') ?? [];
  toursList = data.cast<Tour>();
}

Future<void> updateTours() async {
  final box = await Hive.openBox('tournaments_box');
  await box.put('toursList', toursList);
  toursList = await box.get('toursList');
}
