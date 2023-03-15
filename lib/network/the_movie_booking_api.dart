
import 'package:dio/dio.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/network/responses/get_banners_response.dart';
import 'package:movie_booking_app/network/responses/get_cities_response.dart';
import 'package:movie_booking_app/network/responses/get_movie_list_response.dart';
import 'package:movie_booking_app/network/responses/get_otp_response.dart';
import 'package:movie_booking_app/network/responses/get_sign_in_with_phone_response.dart';
import 'package:retrofit/http.dart';

part 'the_movie_booking_api.g.dart';

@RestApi(baseUrl:  BASE_URL)
abstract class TheMovieBookingApi{

  factory TheMovieBookingApi(Dio dio) = _TheMovieBookingApi;

  @GET(ENDPOINT_GET_CITIES)
  Future<GetCitiesResponse> getCities();

  @POST(ENDPOINT_GET_OTP)
  @FormUrlEncoded()
  Future<GetOtpResponse> getOtp(@Field(PARAM_PHONE) String PARAM_PHONE);

  @POST(ENDPOINT_SIGN_IN_WITH_PHONE)
  @FormUrlEncoded()
  Future<GetSignInWithPhoneResponse> signInWithPhone(@Field(PARAM_PHONE) String PARAM_PHONE,
      @Field(PARAM_OTP) String PARAM_OTP
      );

  @POST(ENDPOINT_LOGOUT)
  @FormUrlEncoded()
  Future<String> logout(@Header(PARAM_HEADER) String PARAM_HEADER);

  @GET(ENDPOINT_GET_BANNER)
  Future<GetBannersResponse> getBanners();

  @GET(ENDPOINT_GET_MOVIE_LIST)
  Future<GetMovieListResponse> getMovieList(@Query(PARAM_STATUS) String PARAM_STATUS,);

}