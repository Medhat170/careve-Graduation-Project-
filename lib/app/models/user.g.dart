// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..id = fields[0] as String
      ..name = fields[1] as String
      ..phone = fields[2] as String
      ..email = fields[3] as String
      ..image = fields[4] as String
      ..accessToken = fields[5] as String
      ..bloodType = fields[6] as String
      ..address = fields[7] as String
      ..dateOfBirth = fields[8] as DateTime
      ..cost = fields[9] as String
      ..cv = fields[10] as String
      ..nationalId = fields[11] as String;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.accessToken)
      ..writeByte(6)
      ..write(obj.bloodType)
      ..writeByte(7)
      ..write(obj.address)
      ..writeByte(8)
      ..write(obj.dateOfBirth)
      ..writeByte(9)
      ..write(obj.cost)
      ..writeByte(10)
      ..write(obj.cv)
      ..writeByte(11)
      ..write(obj.nationalId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
