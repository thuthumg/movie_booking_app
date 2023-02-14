import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class GradientView extends StatelessWidget {
  const GradientView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Text("12:30 PM",style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_1X,
            fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 5,),
          Text("3D IMAX",style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 5,),
          Text("Screen 2",style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.w600
          ),),


        ],
      ),
    );
  }
}

