import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/location_page.dart';
import 'package:movie_booking_app/pages/get_otp_page.dart';
import 'package:movie_booking_app/pages/loading_page.dart';
import 'package:movie_booking_app/pages/movie_detail_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/clip_button.dart';
import 'package:movie_booking_app/widgets/custom_button_bg_view.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';
import 'package:movie_booking_app/widgets/date_time_background_view.dart';
import 'package:movie_booking_app/widgets/my_clipper.dart';


void main() {
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

    );
  }
}
