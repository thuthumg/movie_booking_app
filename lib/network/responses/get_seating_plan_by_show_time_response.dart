import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';

part 'get_seating_plan_by_show_time_response.g.dart';

@JsonSerializable()
class GetSeatingPlanByShowTimeResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<List<SeatVO>>? seatVOList;


  GetSeatingPlanByShowTimeResponse(this.code, this.message, this.seatVOList);

  factory GetSeatingPlanByShowTimeResponse.fromJson(Map<String,dynamic> json) =>_$GetSeatingPlanByShowTimeResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetSeatingPlanByShowTimeResponseToJson(this);




}