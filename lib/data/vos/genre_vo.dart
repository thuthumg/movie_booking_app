
import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';

part 'genre_vo.g.dart';

@JsonSerializable()
class GenreVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "name")
  String? name;


  GenreVO(this.id, this.name);

  factory GenreVO.fromJson(Map<String,dynamic> json) =>_$GenreVOFromJson(json);
  Map<String,dynamic> toJson()=> _$GenreVOToJson(this);

}