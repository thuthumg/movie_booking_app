
import 'package:dio/dio.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/network/responses/get_cities_response.dart';
import 'package:retrofit/http.dart';

part 'the_movie_booking_api.g.dart';

@RestApi(baseUrl:  BASE_URL)
abstract class TheMovieBookingApi{

  factory TheMovieBookingApi(Dio dio) = _TheMovieBookingApi;

  @GET(ENDPOINT_GET_CITIES)
  Future<GetCitiesResponse> getCities();

}