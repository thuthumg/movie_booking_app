import 'package:movie_booking_app/data/vos/city_vo.dart';

abstract class MovieBookingAppDataAgent{
  Future<List<CityVO>?>  getCities();
}