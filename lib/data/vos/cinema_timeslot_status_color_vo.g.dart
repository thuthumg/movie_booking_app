// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_timeslot_status_color_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CinemaTimeslotStatusColorVOAdapter
    extends TypeAdapter<CinemaTimeslotStatusColorVO> {
  @override
  final int typeId = 4;

  @override
  CinemaTimeslotStatusColorVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CinemaTimeslotStatusColorVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CinemaTimeslotStatusColorVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.color);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CinemaTimeslotStatusColorVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaTimeslotStatusColorVO _$CinemaTimeslotStatusColorVOFromJson(
        Map<String, dynamic> json) =>
    CinemaTimeslotStatusColorVO(
      json['id'] as int?,
      json['title'] as String?,
      json['color'] as String?,
    );

Map<String, dynamic> _$CinemaTimeslotStatusColorVOToJson(
        CinemaTimeslotStatusColorVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'color': instance.color,
    };
