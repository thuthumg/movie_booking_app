
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';

part 'cinema_timeslot_status_color_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_CINEMA_TIMESLOT_STATUS_COLOR_VO, adapterName: "CinemaTimeslotStatusColorVOAdapter")
class CinemaTimeslotStatusColorVO{

  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "title")
  @HiveField(1)
  String? title;

  @JsonKey(name: "color")
  @HiveField(2)
  String? color;

  CinemaTimeslotStatusColorVO(this.id, this.title, this.color);


  factory CinemaTimeslotStatusColorVO.fromJson(Map<String,dynamic> json) =>_$CinemaTimeslotStatusColorVOFromJson(json);
  Map<String,dynamic> toJson()=> _$CinemaTimeslotStatusColorVOToJson(this);

}