import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/api_constants.dart';

import 'package:movie_booking_app/pages/log_in_page.dart';
import 'package:movie_booking_app/pages/main_page.dart';
import 'package:movie_booking_app/resources/colors.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  bool _taskCompleted = false;
  UserDataVO? userDataVO;
  List<CityVO>? citiesListVO;
  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();

  @override
  void initState() {
    movieBookingAppModel.getCities().then((value){
      debugPrint("cities data = ${value.toString()}");

      citiesListVO = value;
    })
    .catchError((error){
      debugPrint(error.toString());
    });




    if(paramTokenStr.isNotEmpty)
    {
      ///uservo from Database
      movieBookingAppModel.getUserDataFromDatabase(paramTokenStr).then((userVO) {
        setState(() {
          userDataVO = userVO;
          print("check User data = ${userDataVO?.userToken}");
        });
      }).catchError((error) {
        debugPrint(error.toString());
      });
    }


    super.initState();
    _runDelayedTask();
  }

  Future<void> _runDelayedTask() async {
   // print('Starting the delayed task');
    await Future.delayed(Duration(seconds: 3));
   // print('Delayed task completed');
    setState(() {
      _taskCompleted = true;
      _navigateToLogin(context);

    });
  }
  Future<dynamic> _navigateToLogin(BuildContext context) {

   /* if(paramTokenStr.isNotEmpty)
      {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(cityVO: ),
          ),
        );
      }else{
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }*/

    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );


  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: PRIMARY_COLOR,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         // Expanded(child: Text(_taskCompleted? 'Delayed task completed':'Running delayed task...')),
          Expanded(
              flex: 3,
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/logo_loading.png')))
        ],

      ),
    );
  }
}
