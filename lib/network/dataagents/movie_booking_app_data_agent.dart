import 'package:movie_booking_app/data/vos/banner_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';

abstract class MovieBookingAppDataAgent{
  Future<List<CityVO>?>  getCities();
  Future<int?> getOtp(String phoneNum);
  Future<UserDataVO?> getSignInWithPhone(String phoneNum,String otp);
  Future<List<BannerVO>?>  getBanners();
  Future<List<MovieVO>?> getMovieList(String paramStatus);
}