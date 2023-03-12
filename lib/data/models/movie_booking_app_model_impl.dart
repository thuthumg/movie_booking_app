import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_app_data_agent.dart';
import 'package:movie_booking_app/network/dataagents/retrofit_data_agent_impl.dart';

class MovieBookingAppModelImpl extends MovieBookingAppModel{

  MovieBookingAppDataAgent _dataAgent = RetrofitDataAgentImpl();

  static final MovieBookingAppModelImpl _singleton =
  MovieBookingAppModelImpl._internal();

  factory MovieBookingAppModelImpl(){
    return _singleton;
  }

  MovieBookingAppModelImpl._internal();



  @override
  Future<List<CityVO>?> getCities() {
    return _dataAgent.getCities();
  }

}