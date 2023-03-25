// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snack_category_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SnackCategoryVO _$SnackCategoryVOFromJson(Map<String, dynamic> json) =>
    SnackCategoryVO(
      json['id'] as int?,
      json['title'] as String?,
      json['title_mm'] as String?,
      json['is_active'] as int?,
    );

Map<String, dynamic> _$SnackCategoryVOToJson(SnackCategoryVO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title_mm': instance.title_mm,
      'is_active': instance.is_active,
    };
