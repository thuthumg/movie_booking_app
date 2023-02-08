import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title:  Text(
          "Yangon",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(0,255,106,1),
              fontSize: 16,
              shadows: [
                Shadow(
                  offset: Offset(0, 0), //position of shadow
                  blurRadius: 40,//blur intensity of shadow
                  color: Color.fromRGBO(0,255,106,1), //color of shadow with opacity
                ),

                //add more shadow with different position offset here
              ]),
        ),

        leading:  Flexible(
          child: ImageIcon(
            AssetImage("assets/icons/ic_location_arrow.png"),

          ),
        ),
        actions: [
          ImageIcon(
            AssetImage("assets/icons/ic_search.png"),

          ),
          ImageIcon(
            AssetImage('assets/icons/ic_noti.png'),

          ),
          ImageIcon(
            AssetImage('assets/icons/ic_scanner.png'),

          )
          ],

      ),


    );
  }
}
