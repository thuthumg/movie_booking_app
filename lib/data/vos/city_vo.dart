
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';

part 'city_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_CITY_VO, adapterName: "CityVOAdapter")
class CityVO{

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  CityVO(this.id, this.name);

  factory CityVO.fromJson(Map<String,dynamic> json) =>_$CityVOFromJson(json);
  Map<String,dynamic> toJson()=> _$CityVOToJson(this);

}