// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema_and_show_time_by_date_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CinemaAndShowTimeByDateVO _$CinemaAndShowTimeByDateVOFromJson(
        Map<String, dynamic> json) =>
    CinemaAndShowTimeByDateVO(
      json['cinema_id'] as int?,
      json['cinema'] as String?,
      (json['timeslots'] as List<dynamic>?)
          ?.map((e) => TimeslotsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isSelected'] as bool?,
    );

Map<String, dynamic> _$CinemaAndShowTimeByDateVOToJson(
        CinemaAndShowTimeByDateVO instance) =>
    <String, dynamic>{
      'cinema_id': instance.cinemaId,
      'cinema': instance.cinema,
      'timeslots': instance.timeslots,
      'isSelected': instance.isSelected,
    };
