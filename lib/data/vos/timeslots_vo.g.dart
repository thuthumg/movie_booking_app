// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeslots_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeslotsVO _$TimeslotsVOFromJson(Map<String, dynamic> json) => TimeslotsVO(
      json['cinema_day_timeslot_id'] as int?,
      json['start_time'] as String?,
      json['status'] as int?,
      json['color'] as String?,
    );

Map<String, dynamic> _$TimeslotsVOToJson(TimeslotsVO instance) =>
    <String, dynamic>{
      'cinema_day_timeslot_id': instance.cinemaDayTimeslotId,
      'start_time': instance.startTime,
      'status': instance.status,
      'color': instance.color,
    };
