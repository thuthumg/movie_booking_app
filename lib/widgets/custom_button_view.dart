import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class CustomButtonView extends StatelessWidget {
  final double buttonContainerHeight;
  final Color buttonContainerBgColor;
  final double buttonContainerRadius;
  final double iconPadding;
  final double iconWidthHeight;
  final double textFontSize;
  final String textDesc;
  final Color textColor;
  final String iconPath;
  final bool isShowIcon;
  final Function onTapButton;

  CustomButtonView(
      this.onTapButton,
      {this.buttonContainerHeight = 40,
      this.buttonContainerRadius = BORDER_RADIUS,
      this.buttonContainerBgColor = Colors.white,
      this.iconPadding = MARGIN_SMALL,
      this.iconWidthHeight = 30,
      this.textFontSize = TEXT_REGULAR_2X,
      this.textColor = Colors.black,
      this.textDesc = "",
      required this.iconPath,
      this.isShowIcon = true});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: (){
            onTapButton();
          },
          child: Container(
            height: buttonContainerHeight,
            decoration: BoxDecoration(
                color: buttonContainerBgColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(buttonContainerRadius))),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                      visible: isShowIcon,
                      child: Container(
                        padding: EdgeInsets.all(iconPadding),
                        width: iconWidthHeight,
                        height: iconWidthHeight,
                        child: Image.asset(
                          iconPath,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Text(
                    textDesc,
                    style: TextStyle(
                      color: textColor,
                      fontSize: textFontSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
