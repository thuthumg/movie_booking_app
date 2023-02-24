import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/booking_date_time_page.dart';
import 'package:movie_booking_app/pages/cinema_search_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/booking_movie_theaters_view.dart';

class CinemaPage extends StatelessWidget {
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
            child: Container(
              // width: 30,
              //  height: 30,
              child: Image.asset("assets/icons/ic_search.png"),
            ),
          ),
          Container(
            // width: 30,
            // height: 30,
            child: Image.asset("assets/icons/ic_noti.png"),
          ),
          Container(
            // width: 30,
            //  height: 30,
            child: Image.asset("assets/icons/ic_scan.png"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
          child: Column(
            children: [
              MovieBookingTimeStatus(),
              SizedBox(height: 15,),
              BookingMovieTheatersView(),
            ],
          ),
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