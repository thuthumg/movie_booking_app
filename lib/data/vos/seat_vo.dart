
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/resources/strings.dart';

part 'seat_vo.g.dart';

@JsonSerializable()
class SeatVO{

  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "type")
  String? type;

  @JsonKey(name: "seat_name")
  String? seatName;

  @JsonKey(name: "symbol")
  String? symbol;

  @JsonKey(name: "price")
  int? price;


  SeatVO(this.id, this.type, this.seatName, this.symbol, this.price);

  factory SeatVO.fromJson(Map<String,dynamic> json) =>_$SeatVOFromJson(json);
  Map<String,dynamic> toJson()=> _$SeatVOToJson(this);


  bool isMovieSeatAvailable(){
    return type == SEAT_TYPE_AVAILABLE;
  }

  bool isMovieSeatTaken(){
    return type == SEAT_TYPE_TAKEN;
  }

  bool isMovieSeatRowTitle(){
    return type == SEAT_TYPE_TEXT;
  }

  bool isMovieSeatYourSelection(){
    return type == SEAT_TYPE_SELECTION;
  }



}
