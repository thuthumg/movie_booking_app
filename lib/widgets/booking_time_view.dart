import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/booking_date_time_page.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class BookingTimeView extends StatelessWidget {

  final TheaterBookingTimeObject theaterBookingTimeObject;
//  Function onTapDateTime;

  BookingTimeView(this.theaterBookingTimeObject);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 385,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(
              color: Color.fromRGBO(0, 255, 163, 1),
              width: 1.0,
              style: BorderStyle.solid,
              strokeAlign: StrokeAlign.inside
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(0, 255, 163, 0.1),
                Color.fromRGBO(0, 255, 163, 0.1)])),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(theaterBookingTimeObject.bookingTime,style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_1X,
                fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 5,),
            Text(theaterBookingTimeObject.movieViewType,style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 5,),
            Text(theaterBookingTimeObject.screen,style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 5,),
            theaterBookingTimeObject.availableCountString.isNotEmpty?
            Text(theaterBookingTimeObject.availableCountString,style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w600
            ),) : Text(""),


          ],
        ),
      ),
    );
  }
}
