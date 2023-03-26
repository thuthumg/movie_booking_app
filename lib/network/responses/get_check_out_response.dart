import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/check_out_vo.dart';

part 'get_check_out_response.g.dart';
@JsonSerializable()
class GetCheckOutResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  CheckOutVO? data;


  GetCheckOutResponse(this.code, this.message, this.data);

  factory GetCheckOutResponse.fromJson(Map<String,dynamic> json) =>_$GetCheckOutResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetCheckOutResponseToJson(this);

}