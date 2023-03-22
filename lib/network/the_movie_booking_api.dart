import 'package:dio/dio.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/network/responses/get_banners_response.dart';
import 'package:movie_booking_app/network/responses/get_cinema_day_timeslots_response.dart';
import 'package:movie_booking_app/network/responses/get_cities_response.dart';
import 'package:movie_booking_app/network/responses/get_config_response.dart';
import 'package:movie_booking_app/network/responses/get_movie_detail_response.dart';
import 'package:movie_booking_app/network/responses/get_movie_list_response.dart';
import 'package:movie_booking_app/network/responses/get_otp_response.dart';
import 'package:movie_booking_app/network/responses/get_seating_plan_by_show_time_response.dart';
import 'package:movie_booking_app/network/responses/get_sign_in_with_phone_response.dart';
import 'package:movie_booking_app/network/responses/logout_response.dart';
import 'package:retrofit/http.dart';

part 'the_movie_booking_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class TheMovieBookingApi {
  factory TheMovieBookingApi(Dio dio) = _TheMovieBookingApi;

  @GET(ENDPOINT_GET_CITIES)
  Future<GetCitiesResponse> getCities();

  @POST(ENDPOINT_GET_OTP)
  @FormUrlEncoded()
  Future<GetOtpResponse> getOtp(@Field(PARAM_PHONE) String PARAM_PHONE);

  @POST(ENDPOINT_SIGN_IN_WITH_PHONE)
  @FormUrlEncoded()
  Future<GetSignInWithPhoneResponse> signInWithPhone(
      @Field(PARAM_PHONE) String PARAM_PHONE,
      @Field(PARAM_OTP) String PARAM_OTP);

  @POST(ENDPOINT_LOGOUT)
  @FormUrlEncoded()
  Future<LogoutResponse> logout(@Header(PARAM_HEADER) String PARAM_HEADER);

  @GET(ENDPOINT_GET_BANNER)
  Future<GetBannersResponse> getBanners();

  @GET(ENDPOINT_GET_MOVIE_LIST)
  Future<GetMovieListResponse> getMovieList(
    @Query(PARAM_STATUS) String PARAM_STATUS,
  );

  @GET('$ENDPOINT_GET_MOVIE_DETAILS/{movie_id}')
  Future<GetMovieDetailResponse> getMovieDetails(
      @Path("movie_id") String movieId);

  @GET(ENDPOINT_GET_CINEMA_AND_SHOW_TIME_BY_DATE)
  Future<GetCinemaDayTimeslotsResponse> getCinemaAndShowTimeByDate(
      @Header(PARAM_HEADER) String PARAM_HEADER,
      @Query(PARAM_DATE) String PARAM_DATE);

  @GET(ENDPOINT_GET_CONFIG)
  Future<GetConfigResponse> getConfigurations();

  @GET(ENDPOINT_GET_SEATING_PLAN_BY_SHOW_TIME)
  Future<GetSeatingPlanByShowTimeResponse> getSeatingPlanByShowTime(
    @Header(PARAM_HEADER) String PARAM_HEADER,
    @Query(PARAM_CINEMA_DAY_TIMESLOT_ID) int PARAM_CINEMA_DAY_TIMESLOT_ID,
    @Query(PARAM_BOOKING_DATE) String PARAM_BOOKING_DATE,
  );
}
