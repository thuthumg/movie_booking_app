import 'package:movie_booking_app/data/vos/city_vo.dart';

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

   // await getCityBox()
  }

  // Box<CityVO> getCityBox(){
  //   return Hive.box<CityVO>(BOX_NAME_CITY_VO);
  // }
}