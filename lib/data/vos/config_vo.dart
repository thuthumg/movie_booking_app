import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';

part 'config_vo.g.dart';

@JsonSerializable()
class ConfigVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "key")
  String? key;

  @JsonKey(name: "value")
  dynamic value;


  ConfigVO(this.id, this.key, this.value);

  factory ConfigVO.fromJson(Map<String,dynamic> json) =>_$ConfigVOFromJson(json);
  Map<String,dynamic> toJson()=> _$ConfigVOToJson(this);

}