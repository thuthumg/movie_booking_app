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
 // List<CityVO>? citiesListVO;
  String? usertoken;
  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();

  @override
  void initState() {

    ///cities and status colors data from Network
   movieBookingAppModel.getCities();
   movieBookingAppModel.getConfigurations();

    ///uservo from Database
    movieBookingAppModel.getUserDataFromDatabase().then((userDataVO) {
      setState(() {
        usertoken = userDataVO?.userToken.toString()??"";
        userDataVO = userDataVO;
      });



    }).catchError((error) {
      debugPrint("error = "+error.toString());
    });

    super.initState();
    _runDelayedTask(userDataVO);
  }

  Future<void> _runDelayedTask(UserDataVO? userDataVO) async {
   // print('Starting the delayed task');
    await Future.delayed(Duration(seconds: 3));
   // print('Delayed task completed');
    setState(() {
      _taskCompleted = true;
      print('check token ${usertoken}');
      if(usertoken == null || usertoken == "")
      {
        _navigateToLogin(context);
      }else{

        _navigateToHome(context,userDataVO);
      }
     // _navigateToLogin(context);

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
        builder: (context) => LoginPage(paramPhoneNumber: "",),
      ),
    );


  }

  Future<dynamic> _navigateToHome(BuildContext context,UserDataVO? userDataVO) {
    print("from loading page loacation data ${userDataVO?.selectedLocationName}");
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPage(cityVOName: userDataVO?.selectedLocationName??"",),
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
