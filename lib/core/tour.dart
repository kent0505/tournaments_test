import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Tour {
  Tour({
    required this.id,
    required this.title,
    required this.amount,
    required this.participants,
    this.winner = '',
    this.finished = false,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String amount;
  @HiveField(3)
  String winner;
  @HiveField(4)
  List participants;
  @HiveField(5)
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
      winner: reader.readString(),
      participants: reader.readList(),
      finished: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Tour obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.title);
    writer.writeString(obj.amount);
    writer.writeString(obj.winner);
    writer.writeList(obj.participants);
    writer.writeBool(obj.finished);
  }
}
