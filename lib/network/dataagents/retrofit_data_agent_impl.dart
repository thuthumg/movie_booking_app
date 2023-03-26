import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/vos/banner_vo.dart';
import 'package:movie_booking_app/data/vos/check_out_vo.dart';
import 'package:movie_booking_app/data/vos/cinema_and_show_time_by_date_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/config_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/payment_type_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_app_data_agent.dart';
import 'package:movie_booking_app/network/requests/check_out_request.dart';
import 'package:movie_booking_app/network/responses/get_sign_in_with_phone_response.dart';
import 'package:movie_booking_app/network/the_movie_booking_api.dart';

class RetrofitDataAgentImpl extends MovieBookingAppDataAgent {
  late TheMovieBookingApi mMovieBookingApi;

  ///Singleton

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() {
    return _singleton;
  }

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    final interceptor = LogInterceptor(
      requestHeader: true,
      // don't log request headers
      requestBody: true,
      // don't log request body
      responseHeader: true,
      // don't log response headers
      responseBody: true,
      // log response body only
      logPrint: (message) =>
          debugPrint(message.toString()), // use debugPrint for logging
    );
    dio.interceptors.add(interceptor);

    mMovieBookingApi = TheMovieBookingApi(dio);
  }

  @override
  Future<List<CityVO>?> getCities() {
    return mMovieBookingApi
        .getCities()
        .asStream()
        .map((response) => response.data)
        .first;
  }

  @override
  Future<int?> getOtp(String phoneNum) {
    return mMovieBookingApi
        .getOtp(phoneNum)
        .asStream()
        .map((event) => event.code)
        .first;
  }

  @override
  Future<UserDataVO?> getSignInWithPhone(String phoneNum, String otp) {
    return mMovieBookingApi
        .signInWithPhone(phoneNum, otp)
        .asStream()
        .map((response) {
          if(response.code == API_LOGIN_SUCCESS_CODE)
            {
              print("success api for user data");
              response.userDataVO?.message = "";
              response.userDataVO?.userToken = response.token;
              print("success api for user data c1 = ${ response.userDataVO?.userToken} /// ${response.token}");
             // response.userDataVO = response.userDataVO;
            }else{
            print("fail api for user data");
            response.userDataVO?.message = response.message;
            print("fail api for user data c1 = ${response.userDataVO?.message} /// ${response.message}");
          }
          return response.userDataVO;

    }).first;
  }

  @override
  Future<List<BannerVO>?> getBanners() {
    return  mMovieBookingApi
        .getBanners()
        .asStream()
        .map((response) => response.data)
        .first;

  }

  @override
  Future<List<MovieVO>?> getMovieList(String paramStatus) {

    if(paramStatus == 'NowShowing')
      {
        return  mMovieBookingApi
            .getMovieList('current')
            .asStream()
            .map((response) => response.data)
            .first;
      }
    else if (paramStatus == 'ComingSoon'){
      return  mMovieBookingApi
          .getMovieList('comingsoon')
          .asStream()
          .map((response) => response.data)
          .first;
    }
    else {
      return  mMovieBookingApi
          .getMovieList('current')
          .asStream()
          .map((response) => response.data)
          .first;
    }



  }

  @override
  Future<String?> logout(String paramTokenStr) {
   return mMovieBookingApi
       .logout(paramTokenStr)
       .asStream()
       .map((response) => response.message)
       .first;
  }

  @override
  Future<MovieVO?> getMovieDetails(int movieId) {
    return mMovieBookingApi
        .getMovieDetails(movieId.toString())
        .asStream()
        .map((response) => response.movieVO)
        .first;
  }

  @override
  Future<List<ConfigVO>?> getConfigurations() {
   return mMovieBookingApi
       .getConfigurations()
       .asStream()
       .map((response) => response.cinemaAndShowTimeByDateVO)
       .first;
  }

  @override
  Future<List<CinemaAndShowTimeByDateVO>?> getCinemaAndShowTimeByDate(
      String tokenStr, String date) {
    print("check tokenstr in retrofit data agent ${tokenStr}");
    return mMovieBookingApi
        .getCinemaAndShowTimeByDate(tokenStr, date)
        .asStream()
        .map((response) => response.cinemaAndShowTimeByDateVO)
        .first;
  }

  @override
  Future<List<List<SeatVO>>?> getSeatingPlanByShowTime(String tokenStr, String date, int cinemaDayTimeSlotId) {
    return mMovieBookingApi
        .getSeatingPlanByShowTime(
        tokenStr, cinemaDayTimeSlotId, date)
        .asStream()
        .map((response) => response.seatVOList)
        .first;
  }

  @override
  Future<List<SnackCategoryVO>?> getSnackCategoriesList(String paramTokenStr) {
    return mMovieBookingApi
        .getSnackCategory(paramTokenStr)
        .asStream()
        .map((response) => response.data)
        .first;
  }

  @override
  Future<List<SnackVO>?> getSnacksList(String paramTokenStr, int categoryId) {
   return mMovieBookingApi
       .getSnacks(paramTokenStr, categoryId)
       .asStream()
       .map((response) => response.data)
       .first;
  }

  @override
  Future<List<PaymentTypeVO>?> getPaymentTypesList(String paramTokenStr) {
    return mMovieBookingApi
        .getPaymentTypes(paramTokenStr)
        .asStream()
        .map((response) => response.data)
        .first;
  }

  @override
  Future<CheckOutVO?> checkOut(String paramTokenStr, CheckOutRequest checkOutRequest) {

    print("check checkout request param data = ${paramTokenStr} /// ${checkOutRequest}");

    return mMovieBookingApi
        .checkOut(paramTokenStr, "application/json",checkOutRequest)
        .asStream()
        .map((response) => response.data)
        .first;
  }
}
