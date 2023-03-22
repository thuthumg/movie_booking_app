import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/timeslots_vo.dart';

part 'cinema_and_show_time_by_date_vo.g.dart';

@JsonSerializable()
class CinemaAndShowTimeByDateVO{

  @JsonKey(name: "cinema_id")
  int? cinemaId;

  @JsonKey(name: "cinema")
  String? cinema;

  @JsonKey(name: "timeslots")
  List<TimeslotsVO>? timeslots;

  bool? isSelected;


  CinemaAndShowTimeByDateVO(
      this.cinemaId, this.cinema, this.timeslots, this.isSelected);

  factory CinemaAndShowTimeByDateVO.fromJson(Map<String,dynamic> json) =>_$CinemaAndShowTimeByDateVOFromJson(json);
  Map<String,dynamic> toJson()=> _$CinemaAndShowTimeByDateVOToJson(this);

}