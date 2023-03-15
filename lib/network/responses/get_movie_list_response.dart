import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';

part 'get_movie_list_response.g.dart';

@JsonSerializable()
class GetMovieListResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  List<MovieVO>? data;


  GetMovieListResponse(this.code, this.message, this.data);

  factory GetMovieListResponse.fromJson(Map<String,dynamic> json) =>_$GetMovieListResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetMovieListResponseToJson(this);

}