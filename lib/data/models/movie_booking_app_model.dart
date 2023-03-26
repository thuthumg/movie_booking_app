import 'package:movie_booking_app/data/vos/banner_vo.dart';
import 'package:movie_booking_app/data/vos/check_out_vo.dart';
import 'package:movie_booking_app/data/vos/cinema_and_show_time_by_date_vo.dart';
import 'package:movie_booking_app/data/vos/cinema_timeslot_status_color_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/config_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/payment_type_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/requests/check_out_request.dart';

abstract class MovieBookingAppModel{

  ///Network
  Future<List<CityVO>?> getCities();
  Future<int?> getOtp(String phoneNum);
  Future<UserDataVO?> getSignInWithPhone(String phoneNum,String otp);
  //Future<UserDataVO?> getUserDataFromDatabase(String userToken);

  Future<UserDataVO?> getUserDataFromDatabase();
  Future<List<BannerVO>?>  getBanners();
  Future<List<MovieVO>?> getMovieList(String paramStatus);
  Future<String?> logout(String paramTokenStr);
  Future<MovieVO?> getMovieDetails(int movieId);
  Future<List<CinemaTimeslotStatusColorVO>?>  getConfigurations();
  Future<List<CinemaAndShowTimeByDateVO>?> getCinemaAndShowTimeByDate(
      String tokenStr,
      String date);

  Future<List<List<SeatVO>>?> getSeatingPlanByShowTime(
      String tokenStr,
      String date,
      int cinemaDayTimeSlotId);

  Future<List<PaymentTypeVO>?>  getPaymentTypesList(String paramTokenStr);

  Future<CheckOutVO?>  checkOut(String paramTokenStr,CheckOutRequest checkOutRequest);

  ///Database
  Future<List<CityVO>?> getCitiesFromDatabase();

  void updateUserDataVO(UserDataVO? userDataVO);

  Future<List<SnackCategoryVO>?>  getSnackCategoriesList(String paramTokenStr);

  Future<List<SnackVO>?>  getSnacksList(String paramTokenStr,int categoryId);

}