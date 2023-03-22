
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_booking_app/data/vos/cinema_timeslot_status_color_vo.dart';
import 'package:movie_booking_app/data/vos/config_vo.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';

class CinemaTimeslotStatusColorDao{

  static final CinemaTimeslotStatusColorDao _singleton =
  CinemaTimeslotStatusColorDao._internal();

  factory CinemaTimeslotStatusColorDao(){
    return _singleton;
  }

  CinemaTimeslotStatusColorDao._internal();

  void saveAllCinemaTimeSlotStatusColorVOs(List<CinemaTimeslotStatusColorVO> cinemaTimeslotStatusColorVOList) async{
    Map<int,CinemaTimeslotStatusColorVO> cinemaTimeslotStatusColorVOMap = Map.fromIterable(
        cinemaTimeslotStatusColorVOList,
        key: (cinemaTimeslotStatusColorVO) => cinemaTimeslotStatusColorVO.id,
        value: (cinemaTimeslotStatusColorVO) => cinemaTimeslotStatusColorVO
    );

    await getCinemaTimeslotStatusColorBox().putAll(
        cinemaTimeslotStatusColorVOMap);
  }

  List<CinemaTimeslotStatusColorVO> getAllCinemaTimeSlotStatusColorVOs(){
    return getCinemaTimeslotStatusColorBox().values.toList();
  }

  Box<CinemaTimeslotStatusColorVO> getCinemaTimeslotStatusColorBox(){
    return Hive.box<CinemaTimeslotStatusColorVO>(BOX_NAME_CINEMA_TIMESLOT_STATUS_COLOR_VO);
  }


}