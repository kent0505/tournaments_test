import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 1)
class Participant {
  Participant({
    required this.id,
    required this.name,
    this.selected = false,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  bool selected;

  factory Participant.clone(Participant p) {
    return Participant(
      id: p.id,
      name: p.name,
    );
  }
}

class ParticipantAdapter extends TypeAdapter<Participant> {
  @override
  final typeId = 1;

  @override
  Participant read(BinaryReader reader) {
    return Participant(
      id: reader.readInt(),
      name: reader.readString(),
      selected: reader.readBool(),
    );
  }

  @override
  void write(BinaryWriter writer, Participant obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeBool(obj.selected);
  }
}
