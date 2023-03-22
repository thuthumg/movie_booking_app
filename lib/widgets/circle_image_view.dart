import 'package:flutter/material.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class CircleImageView extends StatelessWidget {
  final String? strProfile;

  CircleImageView({this.strProfile});

  @override
  Widget build(BuildContext context) {
    double _size = 80.0;

    return Center(
      child: Container(
          width: _size,
          height: _size,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      '${MOVIE_LIST_IMAGE_BASE_URL}${strProfile}')
              )
          )
      ),
    );
  }

}