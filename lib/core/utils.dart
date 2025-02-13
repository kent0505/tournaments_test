import 'dart:developer' as developer;

import 'package:hive_flutter/hive_flutter.dart';

import 'participant.dart';
import 'tour.dart';

int getTimestamp() => DateTime.now().millisecondsSinceEpoch ~/ 1000;

void logger(Object message) => developer.log(message.toString());

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
