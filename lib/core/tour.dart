import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Tour {
  Tour({
    required this.id,
    required this.title,
    required this.amount,
    required this.participants,
    this.finished = false,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String amount;

  @HiveField(3)
  List participants;

  @HiveField(4)
  bool finished;
}

class TourAdapter extends TypeAdapter<Tour> {
  @override
  final typeId = 0;

  @override
  Tour read(BinaryReader reader) {
    return Tour(
      id: reader.readInt(),
      title: reader.readString(),
      amount: reader.readString(),
      participants: reader.readList(),
      finished: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Tour obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.amount);
    writer.writeList(obj.participants);
    writer.writeBool(obj.finished);
  }
}
