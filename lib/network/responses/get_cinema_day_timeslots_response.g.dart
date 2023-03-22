// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_cinema_day_timeslots_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCinemaDayTimeslotsResponse _$GetCinemaDayTimeslotsResponseFromJson(
        Map<String, dynamic> json) =>
    GetCinemaDayTimeslotsResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) =>
              CinemaAndShowTimeByDateVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCinemaDayTimeslotsResponseToJson(
        GetCinemaDayTimeslotsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.cinemaAndShowTimeByDateVO,
    };
