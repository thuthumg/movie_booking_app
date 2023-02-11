import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class MovieItemView extends StatelessWidget {
  const MovieItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 171,
      margin: EdgeInsets.only(right: MARGIN_CARD_MEDIUM_2),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          // height: 212,
          child: Stack(children: [
            const Positioned.fill(
              child: MovieItemImageView(),
            ),
            const Positioned.fill(
              child: GradientView(),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(MARGIN_MEDIUM),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Venom II",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: TEXT_REGULAR_1X,
                                fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          SizedBox(
                              height: 30,
                              child: Image.asset(
                                  'assets/images/ic_imbd.png')),
                          const Text(
                            "9.0",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: TEXT_REGULAR_1X,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "U/A",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: TEXT_REGULAR_1X,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0),
                            child: Container(
                              height: 8,
                              child:
                              Image.asset('assets/images/ic_dot.png'),
                            ),
                          ),
                          const Text(
                            "2D,3D,3D IMAX",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: TEXT_REGULAR_1X,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      )
                    ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class MovieItemImageView extends StatelessWidget {
  const MovieItemImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212,
      child: Image.asset(
        "assets/images/sample_grid_img_2.png",
        fit: BoxFit.cover,
      ),
    );
  }
}

class GradientView extends StatelessWidget {

  const GradientView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromRGBO(68, 68, 68, 0),
                Color.fromRGBO(68, 68, 68, 0),
                Color.fromRGBO(0, 0, 0, 1)])),
    );
  }
}

