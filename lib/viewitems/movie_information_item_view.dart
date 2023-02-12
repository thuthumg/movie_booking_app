import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class MovieInformationItemView extends StatelessWidget {

  final String firstText;
  final String secondText;

  MovieInformationItemView(this.firstText,this.secondText);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
      height: 70,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
          ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              Text(
                firstText,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 10,),
              Text(
                secondText,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),

    );
  }
}
