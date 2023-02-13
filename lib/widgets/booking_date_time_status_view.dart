import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class BookingDateTimeStatusView extends StatelessWidget {

  final Color statusColor;
  final String statusText;
  final String statusIcon;

  BookingDateTimeStatusView(
      this.statusColor,
      this.statusText,
      this.statusIcon
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 8,
            height: 8,
            child: Image.asset(statusIcon)),
        SizedBox(width: MARGIN_MEDIUM_2,),
        Text(statusText,style: TextStyle(
          color: statusColor,
          fontSize: TEXT_REGULAR_1X,
          fontWeight: FontWeight.w500

        ),)
      ],
    );
  }
}
