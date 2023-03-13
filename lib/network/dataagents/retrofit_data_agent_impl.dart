import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_app_data_agent.dart';
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
}
