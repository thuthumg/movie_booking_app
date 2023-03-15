// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVO _$MovieVOFromJson(Map<String, dynamic> json) => MovieVO(
      json['id'] as int?,
      json['original_title'] as String?,
      json['release_date'] as String?,
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['poster_path'] as String?,
    );

Map<String, dynamic> _$MovieVOToJson(MovieVO instance) => <String, dynamic>{
      'id': instance.id,
      'original_title': instance.originalTitle,
      'release_date': instance.releaseDate,
      'genres': instance.genres,
      'poster_path': instance.posterPath,
    };
