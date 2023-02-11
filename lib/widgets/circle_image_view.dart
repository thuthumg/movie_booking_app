import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class CircleImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = 80.0;

    return Center(
      child: Container(
          width: _size,
          height: _size,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/images/pic_profile.jpg")
              )
          )
      ),
    );
  }

}