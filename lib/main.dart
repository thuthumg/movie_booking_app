import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/cities_location_page.dart';
import 'package:movie_booking_app/pages/get_otp_page.dart';
import 'package:movie_booking_app/pages/home_page.dart';

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
      home: CitiesLocationPage() ,
    );
  }
}
