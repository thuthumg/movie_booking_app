import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/cast_vo.dart';
import 'package:movie_booking_app/data/vos/genre_vo.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';
part 'movie_vo.g.dart';

@JsonSerializable()
//@HiveType(typeId: HIVE_TYPE_ID_MOVIE_VO, adapterName: "MovieVOAdapter")
class MovieVO{

  @JsonKey(name: "id")
  //@HiveField(1)
  int? id;

  @JsonKey(name: "original_title")
  //@HiveField(2)
  String? originalTitle;

  @JsonKey(name: "release_date")
  ///@HiveField(3)
  String? releaseDate;


  @JsonKey(name: "genres")
  //@HiveField(4)
 // List<GenreVO>? genres;
  List<String>? genres;


  @JsonKey(name: "overview")
  //@HiveField(5)
  String? overview;

  @JsonKey(name: "rating")
  //@HiveField(6)
  double? rating;

  @JsonKey(name: "runtime")
  //@HiveField(7)
  int? runtime;

  @JsonKey(name: "poster_path")
  //@HiveField(8)
  String? posterPath;

  @JsonKey(name: "casts")
  //@HiveField(9)
  List<CastVO>? casts;

  String? message;


  MovieVO(
      this.id,
      this.originalTitle,
      this.releaseDate,
      this.genres,
      this.overview,
      this.rating,
      this.runtime,
      this.posterPath,
      this.casts,
      this.message);

  factory MovieVO.fromJson(Map<String,dynamic> json) =>_$MovieVOFromJson(json);
  Map<String,dynamic> toJson()=> _$MovieVOToJson(this);


  @override
  String toString() {
    return 'MovieVO{id: $id, originalTitle: $originalTitle, releaseDate: $releaseDate, genres: $genres, overview: $overview, rating: $rating, runtime: $runtime, posterPath: $posterPath, casts: $casts}';
  }

  List<String> getGenreListAsStringList(){

    return genres?.map((genre) => genre ?? "").toList() ?? [];

  }

  String getGenreListAsCommaSeparatedString(){

    return getGenreListAsStringList().join(",");

  }


  String formatDate() {
    final DateTime date = DateTime.parse(releaseDate??"");
    final String day = DateFormat('d').format(date);
    final String suffix = _getNumberSuffix(day);
    final String month = DateFormat('MMM').format(date);
    return '$day$suffix $month';
  }

  String _getNumberSuffix(String day) {
    final int dayNumber = int.parse(day);
    if (dayNumber >= 11 && dayNumber <= 13) {
      return 'th';
    }
    switch (dayNumber % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }


}