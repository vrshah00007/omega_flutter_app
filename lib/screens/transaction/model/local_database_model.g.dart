// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_database_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchListDataAdapter extends TypeAdapter<WatchListData> {
  @override
  final int typeId = 1;

  @override
  WatchListData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchListData(
      currency: fields[0] as String?,
      isSelected: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, WatchListData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.currency)
      ..writeByte(1)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchListDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
