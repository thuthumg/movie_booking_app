import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/config_vo.dart';
part 'get_config_response.g.dart';
@JsonSerializable()
class GetConfigResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<ConfigVO>? cinemaAndShowTimeByDateVO;


  GetConfigResponse(this.code, this.message, this.cinemaAndShowTimeByDateVO);

  factory GetConfigResponse.fromJson(Map<String,dynamic> json) =>_$GetConfigResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetConfigResponseToJson(this);

}