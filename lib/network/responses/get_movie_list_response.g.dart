// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieListResponse _$GetMovieListResponseFromJson(
        Map<String, dynamic> json) =>
    GetMovieListResponse(
      json['code'] as int?,
      json['message'] as String?,
      (json['data'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetMovieListResponseToJson(
        GetMovieListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
