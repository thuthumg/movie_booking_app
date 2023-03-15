
import 'package:json_annotation/json_annotation.dart';
part 'banner_vo.g.dart';
@JsonSerializable()
class BannerVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "url")
  String? url;


  BannerVO(this.id, this.title, this.url);

  factory BannerVO.fromJson(Map<String,dynamic> json) =>_$BannerVOFromJson(json);
  Map<String,dynamic> toJson()=> _$BannerVOToJson(this);

}