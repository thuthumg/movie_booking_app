import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
part 'movie_vo.g.dart';

@JsonSerializable()
class MovieVO{

@JsonKey(name: "id")
int? id;

@JsonKey(name: "original_title")
String? originalTitle;

@JsonKey(name: "release_date")
String? releaseDate;

@JsonKey(name: "genres")
List<String>? genres;

@JsonKey(name: "poster_path")
String? posterPath;


MovieVO(this.id, this.originalTitle, this.releaseDate, this.genres,
      this.posterPath);

  factory MovieVO.fromJson(Map<String,dynamic> json) =>_$MovieVOFromJson(json);
Map<String,dynamic> toJson()=> _$MovieVOToJson(this);

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