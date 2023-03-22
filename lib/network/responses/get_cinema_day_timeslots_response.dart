import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/cinema_and_show_time_by_date_vo.dart';

part 'get_cinema_day_timeslots_response.g.dart';

@JsonSerializable()
class GetCinemaDayTimeslotsResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<CinemaAndShowTimeByDateVO>? cinemaAndShowTimeByDateVO;

  GetCinemaDayTimeslotsResponse(
      this.code, this.message, this.cinemaAndShowTimeByDateVO);



  factory GetCinemaDayTimeslotsResponse.fromJson(Map<String,dynamic> json) =>_$GetCinemaDayTimeslotsResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetCinemaDayTimeslotsResponseToJson(this);

}