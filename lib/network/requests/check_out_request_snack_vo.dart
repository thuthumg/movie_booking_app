import 'package:json_annotation/json_annotation.dart';

part 'check_out_request_snack_vo.g.dart';
@JsonSerializable()
class CheckOutRequestSnackVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "quantity")
  int? quantity;


  CheckOutRequestSnackVO(this.id, this.quantity);

  factory CheckOutRequestSnackVO.fromJson(Map<String,dynamic> json) =>_$CheckOutRequestSnackVOFromJson(json);
  Map<String,dynamic> toJson()=> _$CheckOutRequestSnackVOToJson(this);

}