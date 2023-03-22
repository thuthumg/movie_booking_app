import 'package:movie_booking_app/data/vos/banner_vo.dart';
import 'package:movie_booking_app/data/vos/cinema_and_show_time_by_date_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/config_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';

abstract class MovieBookingAppDataAgent{
  Future<List<CityVO>?>  getCities();
  Future<int?> getOtp(String phoneNum);
  Future<UserDataVO?> getSignInWithPhone(String phoneNum,String otp);
  Future<List<BannerVO>?>  getBanners();
  Future<List<MovieVO>?> getMovieList(String paramStatus);
  Future<String?> logout(String paramTokenStr);
  Future<MovieVO?> getMovieDetails(int movieId);
  Future<List<ConfigVO>?>  getConfigurations();
  Future<List<CinemaAndShowTimeByDateVO>?> getCinemaAndShowTimeByDate(
      String tokenStr,
      String date);

  Future<List<List<SeatVO>>?> getSeatingPlanByShowTime(
      String tokenStr,
      String date,
      int cinemaDayTimeSlotId);

}