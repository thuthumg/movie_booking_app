import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class CityView extends StatelessWidget {
 final String cityName;
 final Function onTapCity;

 CityView(
     this.cityName,
     this.onTapCity
     );

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60,
      child: Column(
        children:  [
          GestureDetector(
            onTap: (){
              onTapCity();
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: MARGIN_LARGE,right: MARGIN_LARGE),
                child: Text(cityName,
                  style: TextStyle(
                      fontSize: TEXT_REGULAR,
                      color: Colors.white,
                      fontWeight: FontWeight.w400
                  ),),
              ),
            ),
          ),

          Expanded(flex: 1, child: Divider(color: CITIES_LIST_DIVIDER_COLOR))

        ],
      ),
    );
  }
}
