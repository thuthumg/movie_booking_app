import 'package:json_annotation/json_annotation.dart';
part 'timeslots_vo.g.dart';
@JsonSerializable()
class TimeslotsVO{

  @JsonKey(name: "cinema_day_timeslot_id")
  int? cinemaDayTimeslotId;

  @JsonKey(name: "start_time")
  String?  startTime;

  @JsonKey(name: "status")
  int? status;

  String? color;


  TimeslotsVO(
      this.cinemaDayTimeslotId, this.startTime, this.status, this.color);

  factory TimeslotsVO.fromJson(Map<String,dynamic> json) =>_$TimeslotsVOFromJson(json);
  Map<String,dynamic> toJson()=> _$TimeslotsVOToJson(this);

}