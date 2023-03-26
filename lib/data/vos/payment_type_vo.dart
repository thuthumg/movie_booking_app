import 'package:json_annotation/json_annotation.dart';

part 'payment_type_vo.g.dart';

@JsonSerializable()
class PaymentTypeVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "icon")
  String? icon;


  PaymentTypeVO(this.id, this.title, this.icon);

  factory PaymentTypeVO.fromJson(Map<String,dynamic> json) =>_$PaymentTypeVOFromJson(json);
  Map<String,dynamic> toJson()=> _$PaymentTypeVOToJson(this);

}
