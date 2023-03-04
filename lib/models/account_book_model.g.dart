// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ABModelAdapter extends TypeAdapter<ABModel> {
  @override
  final int typeId = 0;

  @override
  ABModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ABModel(
      isExpanse: fields[0] as bool,
      index: fields[1] as int,
      money: fields[2] as int,
      descript: fields[3] as String,
      category: fields[4] as String,
      date: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ABModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.isExpanse)
      ..writeByte(1)
      ..write(obj.index)
      ..writeByte(2)
      ..write(obj.money)
      ..writeByte(3)
      ..write(obj.descript)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ABModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}