// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataVOAdapter extends TypeAdapter<UserDataVO> {
  @override
  final int typeId = 2;

  @override
  UserDataVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as int?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataVO obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.totalExpense)
      ..writeByte(5)
      ..write(obj.profileImage)
      ..writeByte(6)
      ..write(obj.userToken)
      ..writeByte(7)
      ..write(obj.message)
      ..writeByte(8)
      ..write(obj.selectedLocationName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataVO _$UserDataVOFromJson(Map<String, dynamic> json) => UserDataVO(
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['total_expense'] as int?,
      json['profile_image'] as String?,
      json['userToken'] as String?,
      json['message'] as String?,
      json['selectedLocationName'] as String?,
    );

Map<String, dynamic> _$UserDataVOToJson(UserDataVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'total_expense': instance.totalExpense,
      'profile_image': instance.profileImage,
      'userToken': instance.userToken,
      'message': instance.message,
      'selectedLocationName': instance.selectedLocationName,
    };
