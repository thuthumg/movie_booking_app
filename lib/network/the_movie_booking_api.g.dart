// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'the_movie_booking_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _TheMovieBookingApi implements TheMovieBookingApi {
  _TheMovieBookingApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://tmba.padc.com.mm';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GetCitiesResponse> getCities() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetCitiesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/cities',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCitiesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetOtpResponse> getOtp(PARAM_PHONE) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {'phone': PARAM_PHONE};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetOtpResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/api/v2/get-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetOtpResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetSignInWithPhoneResponse> signInWithPhone(
    PARAM_PHONE,
    PARAM_OTP,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = {
      'phone': PARAM_PHONE,
      'otp': PARAM_OTP,
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetSignInWithPhoneResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/api/v2/check-otp',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetSignInWithPhoneResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<LogoutResponse> logout(PARAM_HEADER) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': PARAM_HEADER};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<LogoutResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/x-www-form-urlencoded',
    )
            .compose(
              _dio.options,
              '/api/v1/logout',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = LogoutResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetBannersResponse> getBanners() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetBannersResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/banners',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetBannersResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetMovieListResponse> getMovieList(PARAM_STATUS) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'status': PARAM_STATUS};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetMovieListResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/movies',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetMovieListResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetMovieDetailResponse> getMovieDetails(movieId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetMovieDetailResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v1/movies//${movieId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetMovieDetailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetCinemaDayTimeslotsResponse> getCinemaAndShowTimeByDate(
    PARAM_HEADER,
    PARAM_DATE,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'date': PARAM_DATE};
    final _headers = <String, dynamic>{r'Authorization': PARAM_HEADER};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetCinemaDayTimeslotsResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/cinema-day-timeslots',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetCinemaDayTimeslotsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetConfigResponse> getConfigurations() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetConfigResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/configurations',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetConfigResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetSeatingPlanByShowTimeResponse> getSeatingPlanByShowTime(
    PARAM_HEADER,
    PARAM_CINEMA_DAY_TIMESLOT_ID,
    PARAM_BOOKING_DATE,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'cinema_day_timeslot_id': PARAM_CINEMA_DAY_TIMESLOT_ID,
      r'booking_date': PARAM_BOOKING_DATE,
    };
    final _headers = <String, dynamic>{r'Authorization': PARAM_HEADER};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetSeatingPlanByShowTimeResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/seat-plan',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetSeatingPlanByShowTimeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetSnackCategoriesResponse> getSnackCategory(PARAM_HEADER) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': PARAM_HEADER};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetSnackCategoriesResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/snack-categories',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetSnackCategoriesResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetSnacksResponse> getSnacks(
    PARAM_HEADER,
    PARAM_CATEGORY_ID,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'category_id': PARAM_CATEGORY_ID
    };
    final _headers = <String, dynamic>{r'Authorization': PARAM_HEADER};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GetSnacksResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/v2/snacks',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetSnacksResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
