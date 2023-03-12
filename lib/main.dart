import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/pages/loading_page.dart';
import 'package:movie_booking_app/persistence/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()  async{

  await Hive.initFlutter();


  Hive.registerAdapter(CityVOAdapter());

  await Hive.openBox<CityVO>(BOX_NAME_CITY_VO);


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
        primarySwatch: Colors.blue,
      ),
      home: LoadingPage()
      //LoadingPage()
//SnackPage()
    );
  }
}
