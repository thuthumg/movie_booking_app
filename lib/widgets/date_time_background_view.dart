import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class DateTimeBackgroundView extends StatelessWidget {


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

  DateTimeBackgroundView({
    this.circleTopLeftPadding = 150,
    this.circleTopRightPadding = 150,
    this.circleWH = 20.0,
    this.circleRadius = 10.0,
    this.rectBgHeight = 200.0,
    this.rectBgLeftPadding = 10.0,
    this.rectBgRightPadding = 10.0,
    this.rectBgColor = SECONDARY_COLOR,
    this.rectBorderRadius = 8.0,
    this.circleColor  = Colors.black,
    this.textDesc = "Button"
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 200,
     child:Stack(
       children:[
         Positioned(
           top: 0,
           left: 0,
           right: 0,
           child: Container(
            // height: rectBgHeight,
             margin: EdgeInsets.only(left: rectBgLeftPadding,
                 right: rectBgRightPadding),
             decoration: BoxDecoration(
                 color: rectBgColor,
                 borderRadius: BorderRadius.circular(rectBorderRadius)
               //more than 50% of width makes circle
             ),
             child: Center(
               child: Text(
                 "Today\nMay\n8",style: TextStyle(
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

         Align(
           alignment: Alignment.topCenter,
           child: Container(
             margin: EdgeInsets.only(top: MARGIN_CARD_MEDIUM_2),
             height:20,
             width: 100,
             decoration: BoxDecoration(
                 color: circleColor,
                 borderRadius: BorderRadius.circular(20)
               //more than 50% of width makes circle
             ),
           ),
         ),

       ],
     ),
    );


  }
}
