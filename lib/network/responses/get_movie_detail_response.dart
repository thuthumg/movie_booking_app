import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/banner_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
part 'get_movie_detail_response.g.dart';
@JsonSerializable()
class GetMovieDetailResponse{

  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "data")
  MovieVO? movieVO;


  GetMovieDetailResponse(this.code, this.message, this.movieVO);

  factory GetMovieDetailResponse.fromJson(Map<String,dynamic> json) =>_$GetMovieDetailResponseFromJson(json);
  Map<String,dynamic> toJson()=> _$GetMovieDetailResponseToJson(this);

}