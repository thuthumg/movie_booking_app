import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class MovieInformationItemView extends StatelessWidget {
  const MovieInformationItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
          ),
        child: Column(
          children: const [
            Text(
              "Censor Rating",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "U/A",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),

    );
  }
}
