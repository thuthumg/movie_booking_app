import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/vos/banner_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_app_data_agent.dart';
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
      requestHeader: false,
      // don't log request headers
      requestBody: true,
      // don't log request body
      responseHeader: false,
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
}
