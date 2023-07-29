import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/cinema_and_show_time_by_date_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/pages/cinema_search_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/booking_movie_theaters_view.dart';

class CinemaPage extends StatefulWidget {

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  MovieVO? movieDetailsObj;


  ///Model
  MovieBookingAppModel _movieBookingAppModel = MovieBookingAppModelImpl();

  ///State Variables
  UserDataVO? userVO;

  List<CinemaAndShowTimeByDateVO>? cinemaAndShowTimeByDateVO;
  String? selectedDateStr;

  @override
  void initState() {

    ///userdata from Network
    _movieBookingAppModel.getUserDataFromDatabase().then((paramUserVO) {
      print("check user VO from timeslot page ${paramUserVO?.userToken}");
      setState(() {
        userVO = paramUserVO;
        selectedDateStr = currentDate();
        ///cinema date time list from Network
        _movieBookingAppModel.getCinemaAndShowTimeByDate(
            'Bearer ${userVO?.userToken??""}',
            currentDate()).then((paramCinemaAndShowTimeByDateVO){
          setState(() {
            cinemaAndShowTimeByDateVO = paramCinemaAndShowTimeByDateVO;
          });

        }).catchError((error) {
          showToastMessage(error.toString());
        });


      });
      print("check user VO from timeslot page 2 ${userVO?.userToken}");
    }).catchError((error) {
      showToastMessage(error.toString());
    });

    super.initState();
  }

  void showToastMessage(String msgString) {
    Fluttertoast.showToast(
        msg: msgString,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: PRIMARY_COLOR,
        actions: [
          GestureDetector(
            onTap: (){
              _navigateToCinemaSearchPage(context);
            },
            child: Image.asset("assets/icons/ic_search.png"),
          ),
          Image.asset("assets/icons/ic_noti.png"),
          Image.asset("assets/icons/ic_scan.png")
        ],
      ),
      body:

      SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(MARGIN_MEDIUM_3),
          child: BookingMovieTheatersView(
              cinemaAndShowTimeByDateVO: cinemaAndShowTimeByDateVO??[],selectedDateStr: '',
              movieDetailsObj: movieDetailsObj),
        ),
      ),
    );
  }
}
Future<dynamic> _navigateToCinemaSearchPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CinemaSearchPage(),
    ),
  );
}

