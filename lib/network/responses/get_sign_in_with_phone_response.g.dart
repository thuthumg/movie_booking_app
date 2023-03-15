// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_sign_in_with_phone_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSignInWithPhoneResponse _$GetSignInWithPhoneResponseFromJson(
        Map<String, dynamic> json) =>
    GetSignInWithPhoneResponse(
      json['code'] as int?,
      json['message'] as String?,
      json['data'] == null
          ? null
          : UserDataVO.fromJson(json['data'] as Map<String, dynamic>),
      json['token'] as String?,
    );

Map<String, dynamic> _$GetSignInWithPhoneResponseToJson(
        GetSignInWithPhoneResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.userDataVO,
      'token': instance.token,
    };
