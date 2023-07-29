import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_booking_app/config/config_values.dart';
import 'package:movie_booking_app/config/environment_config.dart';
import 'package:movie_booking_app/data/vos/cinema_timeslot_status_color_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/pages/loading_page.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_booking_app/resources/colors.dart';

void main()  async{

  await Hive.initFlutter();


  Hive.registerAdapter(CityVOAdapter());
  Hive.registerAdapter(UserDataVOAdapter());
  Hive.registerAdapter(CinemaTimeslotStatusColorVOAdapter());

  await Hive.openBox<CityVO>(BOX_NAME_CITY_VO);
  await Hive.openBox<UserDataVO>(BOX_NAME_USER_DATA_VO);
  await Hive.openBox<CinemaTimeslotStatusColorVO>(BOX_NAME_CINEMA_TIMESLOT_STATUS_COLOR_VO);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,//THEME_COLORS[EnvironmentConfig.CONFIG_THEME_COLOR]
      ),
      home: LoadingPage()

    );
  }
}
