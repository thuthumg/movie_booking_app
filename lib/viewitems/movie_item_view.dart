import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/movie_list_obj.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class MovieItemView extends StatelessWidget {

  final bool uiChangeFlag;
  final Function onTapItemView;
  final MovieListObj movieListObjItem;

  MovieItemView(this.uiChangeFlag,this.movieListObjItem,this.onTapItemView);
// ()=> Navigator.pop(context),
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTapItemView(),
      child: Container(
      //  width: 171,
        margin: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(children: [
          Positioned.fill(
            child: ClipRRect(
                borderRadius:BorderRadius.circular(8.0),
                child: MovieItemImageView(movieListObjItem.movieImage)),
          ),
          Positioned.fill(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: GradientView()),
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
                        Expanded(
                          flex: 3,
                          child: Text(
                            movieListObjItem.movieName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: TEXT_REGULAR_1X,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                       // const Spacer(),
                        SizedBox(width: MARGIN_MEDIUM,),
                        SizedBox(
                            height: 30,
                            child: Image.asset(
                                'assets/images/ic_imbd.png')),
                        Expanded(
                          child: Text(
                           movieListObjItem.movieRating,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: TEXT_REGULAR_1X,
                                fontWeight: FontWeight.w700),
                          ),
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
                        Expanded(
                          child: Text(

                           movieListObjItem.movieFormatType,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: TEXT_REGULAR_1X,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child:  Visibility(
              visible: !uiChangeFlag,
                child: Padding(
                  padding: const EdgeInsets.only(top: MARGIN_MEDIUM,right: MARGIN_MEDIUM),
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: const BoxDecoration(
                      color: SECONDARY_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Center(
                      child: Text(movieListObjItem.movieComingSoonDate,
                      style: const TextStyle(
                        fontSize: TEXT_REGULAR,
                        color: Color.fromRGBO(85, 85, 85, 1),
                        fontWeight: FontWeight.w700


                      ),),
                    ),

                  ),
                ),
            ),
          )
        ]),
      ),
    );
  }
}

class MovieItemImageView extends StatelessWidget {

  final String movieImage;

  MovieItemImageView(this.movieImage);
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      movieImage,
      fit: BoxFit.cover,
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
                Colors.black87,
                Color.fromRGBO(0, 0, 0, 1)])),
    );
  }
}

