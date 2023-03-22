import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';

class CityDao{

  static final CityDao _singleton =
  CityDao._internal();

  factory CityDao(){
    return _singleton;
  }

  CityDao._internal();

  void saveAllCities(List<CityVO> cities) async{
    Map<int,CityVO> cityMap = Map.fromIterable(
      cities,
      key: (city) => city.id,
      value: (city) => city
    );

    await getCityBox().putAll(cityMap);
  }

  List<CityVO> getAllCities(){
    return getCityBox().values.toList();
  }

  Box<CityVO> getCityBox(){
    return Hive.box<CityVO>(BOX_NAME_CITY_VO);
  }

}