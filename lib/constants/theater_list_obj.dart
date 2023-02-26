import 'package:movie_booking_app/constants/theater_booking_time_obj.dart';

class TheaterListObj{
  String theaterName;
  List<TheaterBookingTimeObject> theaterBookingTimeList;
  bool isSelected;

  TheaterListObj(
      this.theaterName,
      this.theaterBookingTimeList,
      this.isSelected);

}