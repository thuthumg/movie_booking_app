import 'package:json_annotation/json_annotation.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/data/vos/timeslots_vo.dart';

part 'check_out_vo.g.dart';
@JsonSerializable()
class CheckOutVO{


  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "booking_no")
  String? bookingNo;

  @JsonKey(name: "booking_date")
  String? bookingDate;

  @JsonKey(name: "row")
  String? row;

  @JsonKey(name: "seat")
  String? seat;

  @JsonKey(name: "total_seat")
  int? totalSeat;

  @JsonKey(name: "total")
  String? total;

  @JsonKey(name: "movie_id")
  int? movieId;

  @JsonKey(name: "cinema_id")
  int? cinemaId;

  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "timeslot")
  List<TimeslotsVO>? timeslot;

  @JsonKey(name: "snacks")
  List<SnackVO>? snacks;

  @JsonKey(name: "qr_code")
  String? qrCode;


  CheckOutVO(
      this.id,
      this.bookingNo,
      this.bookingDate,
      this.row,
      this.seat,
      this.totalSeat,
      this.total,
      this.movieId,
      this.cinemaId,
      this.username,
      this.timeslot,
      this.snacks,
      this.qrCode);

  factory CheckOutVO.fromJson(Map<String,dynamic> json) =>_$CheckOutVOFromJson(json);
  Map<String,dynamic> toJson()=> _$CheckOutVOToJson(this);

}