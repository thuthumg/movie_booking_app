// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_type_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentTypeResponse _$GetPaymentTypeResponseFromJson(
        Map<String, dynamic> json) =>
    GetPaymentTypeResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => PaymentTypeVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPaymentTypeResponseToJson(
        GetPaymentTypeResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
