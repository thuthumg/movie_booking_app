// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutVO _$CheckOutVOFromJson(Map<String, dynamic> json) => CheckOutVO(
      json['id'] as int?,
      json['booking_no'] as String?,
      json['booking_date'] as String?,
      json['row'] as String?,
      json['seat'] as String?,
      json['total_seat'] as int?,
      json['total'] as String?,
      json['movie_id'] as int?,
      json['cinema_id'] as int?,
      json['username'] as String?,
      (json['timeslot'] as List<dynamic>?)
          ?.map((e) => TimeslotsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['snacks'] as List<dynamic>?)
          ?.map((e) => SnackVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['qr_code'] as String?,
    );

Map<String, dynamic> _$CheckOutVOToJson(CheckOutVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_no': instance.bookingNo,
      'booking_date': instance.bookingDate,
      'row': instance.row,
      'seat': instance.seat,
      'total_seat': instance.totalSeat,
      'total': instance.total,
      'movie_id': instance.movieId,
      'cinema_id': instance.cinemaId,
      'username': instance.username,
      'timeslot': instance.timeslot,
      'snacks': instance.snacks,
      'qr_code': instance.qrCode,
    };
