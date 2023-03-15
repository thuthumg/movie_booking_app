import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';

part 'get_sign_in_with_phone_response.g.dart';

@JsonSerializable()
class GetSignInWithPhoneResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  UserDataVO? userDataVO;

  @JsonKey(name: "token")
  String? token; //"15836|egK4L6YepDIQmeidPdx4c6dCDcRjf401XVmxtR8I"

  GetSignInWithPhoneResponse(this.code, this.message, this.userDataVO,
      this.token);

  factory GetSignInWithPhoneResponse.fromJson(Map<String,dynamic> json) =>_$GetSignInWithPhoneResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetSignInWithPhoneResponseToJson(this);




}