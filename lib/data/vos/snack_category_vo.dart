import 'package:json_annotation/json_annotation.dart';

part 'snack_category_vo.g.dart';

@JsonSerializable()
class SnackCategoryVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;


  @JsonKey(name: "title_mm")
  String? title_mm;

  @JsonKey(name: "is_active")
  int? is_active;


  SnackCategoryVO(this.id, this.title, this.title_mm, this.is_active);

  factory SnackCategoryVO.fromJson(Map<String,dynamic> json) =>_$SnackCategoryVOFromJson(json);
  Map<String,dynamic> toJson()=> _$SnackCategoryVOToJson(this);



}










