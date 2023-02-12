import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class CustomButtonBgView extends StatelessWidget {
 // final Function onTapButton;

 // CustomButtonBgView(this.onTapButton);

  // double circleTopLeftPadding = 140.0;
  // double circleTopRightPadding = 140.0;
  // double circleWH = 50.0;
  // double circleRadius = 25.0;
  // double rectBgHeight = 350.0;
  // double rectBgLeftPadding = 25.0;
  // double rectBgRightPadding = 25.0;
  // Color rectBgColor = Colors.white;
  // double rectBorderRadius = 8.0;
  // Color circleColor  = Colors.black;


  final double circleTopLeftPadding;
  final double circleTopRightPadding;
  final double circleWH;
  final double circleRadius;
  final double rectBgHeight;
  final double rectBgLeftPadding;
  final double rectBgRightPadding;
  final Color rectBgColor;
  final double rectBorderRadius;
  final Color circleColor;
  final String textDesc;

  CustomButtonBgView({
    this.circleTopLeftPadding = 15,
    this.circleTopRightPadding = 15,
    this.circleWH = 28.0,
    this.circleRadius = 14.0,
    this.rectBgHeight = 60.0,
    this.rectBgLeftPadding = 10.5,
    this.rectBgRightPadding = 10.5,
    this.rectBgColor = SECONDARY_COLOR,
    this.rectBorderRadius = 8.0,
    this.circleColor  = Colors.black,
    this.textDesc = "Button"
});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: rectBgHeight,
            margin: EdgeInsets.only(left: rectBgLeftPadding,
                right: rectBgRightPadding),
            decoration: BoxDecoration(
                color: rectBgColor,
                borderRadius: BorderRadius.circular(rectBorderRadius)
              //more than 50% of width makes circle
            ),
            child: Center(
              child: Text(
                textDesc,style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_2X
              ),),
            ),
          ),
        ),

        Positioned(
          top:circleTopLeftPadding,
          left: 0,
          child: Container(
            height:circleWH,
            width: circleWH,
            decoration: BoxDecoration(
                color: circleColor,
                borderRadius: BorderRadius.circular(circleRadius)
              //more than 50% of width makes circle
            ),
          ),
        ),

        Positioned(
          top:circleTopRightPadding,
          right: 0,
          child: Container(
            height:circleWH,
            width: circleWH,
            decoration: BoxDecoration(
                color: circleColor,
                borderRadius: BorderRadius.circular(circleRadius)
              //more than 50% of width makes circle
            ),
          ),
        ),

      ],
    );
  }

}
