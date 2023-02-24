import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/theater_booking_time_obj.dart';
import 'package:movie_booking_app/pages/booking_date_time_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class BookingTimeView extends StatelessWidget {
  final TheaterBookingTimeObject theaterBookingTimeObject;

//  Function onTapDateTime;

  BookingTimeView(this.theaterBookingTimeObject);

  @override
  Widget build(BuildContext context) {
    if (theaterBookingTimeObject.bookingTimeStatus == "Available") {
      return Container(
        height: 385,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(
                color: AVAILIBLE_COLOR,
                width: 1.0,
                style: BorderStyle.solid,
               // strokeAlign: StrokeAlign.inside
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AVAILIBLE_COLOR_TRANSPARENT,
                  AVAILIBLE_COLOR_TRANSPARENT
                ])),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                theaterBookingTimeObject.bookingTime,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                theaterBookingTimeObject.movieViewType,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                theaterBookingTimeObject.screen,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              theaterBookingTimeObject.availableCountString.isNotEmpty
                  ? Text(
                      theaterBookingTimeObject.availableCountString,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_REGULAR,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(""),
            ],
          ),
        ),
      );
    } else if (theaterBookingTimeObject.bookingTimeStatus == "Filling Fast") {
      return Container(
        height: 385,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(
                color: FILLING_FAST_COLOR,
                width: 1.0,
                style: BorderStyle.solid,
               // strokeAlign: StrokeAlign.inside
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  FILLING_FAST_COLOR_TRANSPARENT,
                  FILLING_FAST_COLOR_TRANSPARENT
                ])),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                theaterBookingTimeObject.bookingTime,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                theaterBookingTimeObject.movieViewType,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                theaterBookingTimeObject.screen,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              theaterBookingTimeObject.availableCountString.isNotEmpty
                  ? Text(
                      theaterBookingTimeObject.availableCountString,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_REGULAR,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(""),
            ],
          ),
        ),
      );
    } else if (theaterBookingTimeObject.bookingTimeStatus == "Almost Full") {
      return Container(
        height: 385,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(
                color: ALMOST_FULL_COLOR,
                width: 1.0,
                style: BorderStyle.solid,
              //  strokeAlign: StrokeAlign.inside
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ALMOST_FULL_COLOR_TRANSPARENT,
                  ALMOST_FULL_COLOR_TRANSPARENT
                ])),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                theaterBookingTimeObject.bookingTime,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                theaterBookingTimeObject.movieViewType,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                theaterBookingTimeObject.screen,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              theaterBookingTimeObject.availableCountString.isNotEmpty
                  ? Text(
                      theaterBookingTimeObject.availableCountString,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_REGULAR,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(""),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 385,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            border: Border.all(
                color: Color.fromRGBO(136, 136, 136, 1),
                width: 1.0,
                style: BorderStyle.solid,
              //  strokeAlign: StrokeAlign.inside
            ),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(255, 255, 255, 0.1),
                  Color.fromRGBO(255, 255, 255, 0.1)
                ])),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                theaterBookingTimeObject.bookingTime,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                theaterBookingTimeObject.movieViewType,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                theaterBookingTimeObject.screen,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              theaterBookingTimeObject.availableCountString.isNotEmpty
                  ? Text(
                      theaterBookingTimeObject.availableCountString,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_REGULAR,
                          fontWeight: FontWeight.w600),
                    )
                  : Text(""),
            ],
          ),
        ),
      );
    }
  }
}
