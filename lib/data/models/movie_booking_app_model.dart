import 'package:movie_booking_app/data/vos/city_vo.dart';

abstract class MovieBookingAppModel{

  ///Network
  Future<List<CityVO>?> getCities();
}