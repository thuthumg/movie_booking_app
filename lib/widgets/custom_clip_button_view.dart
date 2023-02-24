import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/clip_button.dart';
import 'package:movie_booking_app/widgets/my_clipper.dart';

class CustomClipButtonView extends StatelessWidget {
  final String btnName;
  final Color customBtnColor;
  final Color textColor;

  CustomClipButtonView(this.btnName,this.customBtnColor,this.textColor);

  @override
  Widget build(BuildContext context) {
    return ClipButton(
      clipper: MyClipper(holeRadius: 20),
      shadow: Shadow(
        color: Colors.grey,
        blurRadius: 2,
        offset: Offset(0.5, 0.5),
      ),
      child: Container(
        padding: EdgeInsets.only(
            left: 30, right: 20, top: 15, bottom: 15),
        decoration: BoxDecoration(
          color: customBtnColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(btnName, style: TextStyle(color: textColor, fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700),)]),
      ),
    );
  }
}