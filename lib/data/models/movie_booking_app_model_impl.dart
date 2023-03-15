import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/vos/banner_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_app_data_agent.dart';
import 'package:movie_booking_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:movie_booking_app/persistence/daos/city_dao.dart';
import 'package:movie_booking_app/persistence/daos/user_data_dao.dart';

class MovieBookingAppModelImpl extends MovieBookingAppModel{

  MovieBookingAppDataAgent _dataAgent = RetrofitDataAgentImpl();

  static final MovieBookingAppModelImpl _singleton =
  MovieBookingAppModelImpl._internal();

  factory MovieBookingAppModelImpl(){
    return _singleton;
  }

  MovieBookingAppModelImpl._internal();


  ///Daos
  UserDataDao userDataDao = UserDataDao();
  CityDao cityDao = CityDao();


  ///get cities from network
  @override
  Future<List<CityVO>?> getCities() {
    return _dataAgent.getCities().then((cities) async{
      cityDao.saveAllCities(cities??[]);
      return Future.value(cities);
    });
  }

  @override
  Future<int?> getOtp(String phoneNum) {
   return _dataAgent.getOtp(phoneNum);
  }

  @override
  Future<UserDataVO?> getSignInWithPhone(String phoneNum, String otp) {
   return _dataAgent.getSignInWithPhone(phoneNum, otp).then((value) async{
     if(value != null)
       {
         print("check user value = ${value.profileImage}");
         userDataDao.saveUserData(value);
       }
     return Future.value(value);
   });
  }

  @override
  Future<UserDataVO?> getUserDataFromDatabase(String userToken) {
    return Future.value(userDataDao.getUserDataByToken(userToken));
  }

  @override
  Future<List<BannerVO>?> getBanners() {
    return _dataAgent.getBanners().then((banners) async{
      return Future.value(banners);
    });
  }

  @override
  Future<List<MovieVO>?> getMovieList(String paramStatus) {
    return _dataAgent.getMovieList(paramStatus).then((moviesList) async{
      return Future.value(moviesList);
    });
  }

  ///get cities from database

  @override
  Future<List<CityVO>?> getCitiesFromDatabase(){

    return Future.value(cityDao
    .getAllCities().toList());
  }




}