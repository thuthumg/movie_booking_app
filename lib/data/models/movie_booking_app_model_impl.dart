import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/vos/banner_vo.dart';
import 'package:movie_booking_app/data/vos/cinema_and_show_time_by_date_vo.dart';
import 'package:movie_booking_app/data/vos/cinema_timeslot_status_color_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/config_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/timeslots_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/dataagents/movie_booking_app_data_agent.dart';
import 'package:movie_booking_app/network/dataagents/retrofit_data_agent_impl.dart';
import 'package:movie_booking_app/persistence/daos/city_dao.dart';
import 'package:movie_booking_app/persistence/daos/cinema_timeslot_status_color_dao.dart';
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
  CinemaTimeslotStatusColorDao cinemaTimeslotStatusColorDao =
  CinemaTimeslotStatusColorDao();


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
         print("check user value = ${value.userToken}");
         userDataDao.saveUserData(value);
       }
     return Future.value(value);
   });
  }

  // @override
  // Future<UserDataVO?> getUserDataFromDatabase(String userToken) {
  //   return Future.value(userDataDao.getUserDataByToken(userToken));
  // }

  @override
  Future<UserDataVO?> getUserDataFromDatabase() {
    return Future.value(userDataDao.getUserDataByToken());
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

  @override
  Future<MovieVO?> getMovieDetails(int movieId) {
    // return _dataAgent.getMovieDetails(movieId);

    return _dataAgent.getMovieDetails(movieId).then((movie) async {
      //
      // if(movie != null) {
      //   mMovieDao.saveSingleMovie(movie);
      // }
      return Future.value(movie);
    });
  }


  ///get cities from database

  @override
  Future<List<CityVO>?> getCitiesFromDatabase(){

    return Future.value(cityDao
    .getAllCities().toList());
  }

  @override
  Future<List<CinemaTimeslotStatusColorVO>?> getCinemaTimeslotStatusColorListFromDatabase(){

    return Future.value(cinemaTimeslotStatusColorDao
        .getAllCinemaTimeSlotStatusColorVOs().toList());
  }

  @override
  void updateUserDataVO(UserDataVO? userDataVO) {
    if(userDataVO != null)
   {
     print("update function ${userDataVO.selectedLocationName} ${userDataVO.userToken}");
     userDataDao.saveUserData(userDataVO);
   }else{
      print("update function null");
    }
  }

  @override
  Future<String?> logout(String paramTokenStr) {
    return _dataAgent.logout(paramTokenStr).then((stringMsg) async{
      userDataDao.deleteBox();
      return Future.value(stringMsg);
    });
  }

  @override
  Future<List<CinemaTimeslotStatusColorVO>?> getConfigurations() {
    return _dataAgent.getConfigurations().then((configurationsVO) async{
      print("check cinema data list = ${ configurationsVO?.elementAt(1).value}");
      dynamic dynamicData = configurationsVO?.elementAt(1).value;

      // Convert dynamicData to List<CinemaTimeslotStatusColorVO>
      List<CinemaTimeslotStatusColorVO> statusColors = [];

      for (var data in dynamicData) {
        CinemaTimeslotStatusColorVO statusColor = CinemaTimeslotStatusColorVO(
             data['id'],
             data['title'],
          data['color']
        );
        statusColors.add(statusColor);
      }

// Print the elements of the new list
      statusColors.forEach((element) {
        print(element.title); // prints available, reserved, unavailable
      });

      cinemaTimeslotStatusColorDao.saveAllCinemaTimeSlotStatusColorVOs(statusColors);

      return Future.value(statusColors);
    });
  }

  @override
  Future<List<CinemaAndShowTimeByDateVO>?> getCinemaAndShowTimeByDate(
      String tokenStr, String date) {
   return _dataAgent.getCinemaAndShowTimeByDate(
       tokenStr, date).then((paramCinemaAndShowTimeByDateVO) async{
      print("getCinemaAndShowTimeByDate fun");
     // List<CinemaTimeslotStatusColorVO> cinemaTimeslotStatusColorList =
     // cinemaTimeslotStatusColorDao.getAllCinemaTimeSlotStatusColorVOs();

     List<CinemaAndShowTimeByDateVO> cinemaTimesAndDateList = paramCinemaAndShowTimeByDateVO??[];

     for(int i=0 ; i<cinemaTimesAndDateList.length; i++) {
       List<TimeslotsVO> timeslotVOList = cinemaTimesAndDateList[i].timeslots ??
           [];
       print("getCinemaAndShowTimeByDate fun first loop = ${timeslotVOList.length}");
       for (int j = 0; j < timeslotVOList.length; j++) {

         List<CinemaTimeslotStatusColorVO> cinemaTimeslotStatusColorList =
         cinemaTimeslotStatusColorDao.getAllCinemaTimeSlotStatusColorVOs();

         //
         // for (int id in timeslotVOList) {
         //   if (cinemaTimeslotStatusColorList.contains(id)) {
         //     print('$id exists in doubleArray');
         //   } else {
         //     print('$id does not exist in doubleArray');
         //   }
         // }
         print("getCinemaAndShowTimeByDate fun second loop = ${cinemaTimeslotStatusColorList.length}");
         for (int k = 0; k < cinemaTimeslotStatusColorList.length; k++) {

          // print("getCinemaAndShowTimeByDate fun third loop");
            print("check status id ${timeslotVOList[j].status} ${cinemaTimeslotStatusColorList[k].id}");
           if (timeslotVOList[j].status ==
               cinemaTimeslotStatusColorList[k].id) {
             timeslotVOList[j].color = cinemaTimeslotStatusColorList[k].color;
            // break;
           }


           // for (TimeslotsVO checkObject in timeslotVOList) {//bool exists =


           // List<DoubleObject> matchingObjects = cinemaTimesAndDateList.where((cinemaDateTimeList) =>
           //     timeslotVOList.map((checkObj) => checkObj.status).contains(doubleObj.timeslots)
           // ).toList();
           //
           // print('Matching objects:');
           // matchingObjects.forEach((doubleObj) => print(doubleObj.id));

           /* cinemaTimeslotStatusColorList.map((doubleObj)=>

           doubleObj.id

         ).any((id)
         {
           if(id == checkObject.status)
               {
                 checkObject.color = doubleObj.color;
               }

         }


         );*/
           /* cinemaTimeslotStatusColorList.map((doubleObj){doubleObj.id}).any((id){
           id == checkObject.status;
           checkObject.color = doubleObj.color;
         }

         );*/
           /*if (exists) {
           print('${checkObject.id} exists in doubleObjectArray');

         } else {

           print('${checkObject.id} does not exist in doubleObjectArray');
         }*/
         }

         /*

       for(int j=0 ; j<timeslotVOList.length; j++){
         List<CinemaTimeslotStatusColorVO> cinemaTimeslotStatusColorList =
         cinemaTimeslotStatusColorDao.getAllCinemaTimeSlotStatusColorVOs();


         for (int id in timeslotVOList) {
           if (cinemaTimeslotStatusColorList.contains(id)) {
             print('$id exists in doubleArray');
           } else {
             print('$id does not exist in doubleArray');
           }
         }

         for(int k=0 ; k<cinemaTimeslotStatusColorList.length; k++){
            print("check status id ${timeslotVOList[j].status} ${cinemaTimeslotStatusColorList[k].id}");
            if(timeslotVOList[j].status == cinemaTimeslotStatusColorList[k].id)
              {
                  timeslotVOList[j].color = cinemaTimeslotStatusColorList[k].color;
                  break;
              }*/
       }
     }

         return Future.value(paramCinemaAndShowTimeByDateVO);
   });
  }

  @override
  Future<List<List<SeatVO>>?> getSeatingPlanByShowTime(String tokenStr, String date, int cinemaDayTimeSlotId) {
    return _dataAgent.getSeatingPlanByShowTime(tokenStr, date, cinemaDayTimeSlotId).then((getSeatingPlanByShowTimeData) async{
    //  List<List<SeatVO>>? changeSeatingPlanByShowTimeDataList=[];
    //  List<SeatVO> changeSeatVOList=[];
      List<List<SeatVO>> paramGetSeatingPlanByShowTimeData = getSeatingPlanByShowTimeData??[];

      for(int i=0 ; i<paramGetSeatingPlanByShowTimeData.length; i++) {
        List<SeatVO> seatVOList = paramGetSeatingPlanByShowTimeData[i];
        for (int j = 0; j < seatVOList.length; j++) {
          if(j == 3 || j == 4)
          {
            seatVOList[j].type = "space";
          }else if(j == 9 || j == 10){
            seatVOList[j].type = "space";
          }
         // changeSeatVOList.add(seatVOList[j]);
          }

       // changeSeatingPlanByShowTimeDataList.add(changeSeatVOList);

      }


      return Future.value(paramGetSeatingPlanByShowTimeData);
    });
  }
//{"id":1,"type":"text","seat_name":"","symbol":"A","price":0},{"id":2,"type":"space","seat_name":"","symbol":"A","price":0}

}