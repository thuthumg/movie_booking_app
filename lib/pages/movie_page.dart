import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/banner_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/pages/movie_detail_page.dart';
import 'package:movie_booking_app/pages/movie_search_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/movie_item_view.dart';

class MoviePage extends StatefulWidget {
  //final CityVO cityVO;

  final String cityVOName;

  const MoviePage({Key? key, required this.cityVOName}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  // bool _uiChangeFlag = true;
  bool _isNowShowing = true;
  bool _isComingSoon = false;
  String nowShowingOrComingSoon = 'NowShowing';

  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();

  ///State Variables
  UserDataVO? userDataVO;
  List<BannerVO>? bannersList;
  List<MovieVO>? moviesList;

  @override
  void initState() {
    //  print("string token = ${paramTokenStr}");

    ///banners from Network
    movieBookingAppModel.getBanners().then((bannersList) {
      setState(() {
        this.bannersList = bannersList;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    ///movies from Network
    movieBookingAppModel
        .getMovieList(nowShowingOrComingSoon)
        .then((moviesList) {
      setState(() {
        this.moviesList = moviesList;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("from movie page loacation data ${widget.cityVOName}");
    if (nowShowingOrComingSoon == 'NowShowing') {
      _isNowShowing = true;
      _isComingSoon = false;
    } else {
      _isNowShowing = false;
      _isComingSoon = true;
      nowShowingOrComingSoon = 'ComingSoon';
    }

    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text(
          widget.cityVOName.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: MARGIN_XLARGE),
          child: Image.asset(
            'assets/icons/ic_location_arrow.png',
            scale: 3,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              _navigateSearchPage(context, nowShowingOrComingSoon);
            },
            child: Image.asset(
              "assets/icons/ic_search.png",
            ),
          ),
          Image.asset(
            "assets/icons/ic_noti.png",
          ),
          Image.asset(
            "assets/icons/ic_scanner.png",
          ),
        ],
      ),
      body: Container(
        color: PRIMARY_COLOR,
        // margin: EdgeInsets.only(left: MARGIN_CARD_MEDIUM_2,
        // right: MARGIN_CARD_MEDIUM_2),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BannerSectionView(bannersList: bannersList),
                  const SizedBox(height: MARGIN_SMALL),
                  //  NowShowingAndComingSoonButtonView(),
                  Container(
                    margin: const EdgeInsets.all(MARGIN_MEDIUM_2),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(102, 102, 102, 0.8),
                              Color.fromRGBO(85, 85, 85, 0.4),
                              Color.fromRGBO(85, 85, 85, 0.4)
                            ])),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isNowShowing = !_isNowShowing;
                                if (_isNowShowing) {
                                  nowShowingOrComingSoon = "NowShowing";
                                } else {
                                  nowShowingOrComingSoon = "ComingSoon";
                                }

                                movieBookingAppModel.getMovieList(nowShowingOrComingSoon).then((moviesList) {
                                  setState(() {
                                    this.moviesList = moviesList;
                                  });
                                }).catchError((error) {
                                  debugPrint(error.toString());
                                });


                              });
                            },
                            child: Container(
                              height: 46,
                              margin: const EdgeInsets.all(MARGIN_MEDIUM),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MARGIN_MEDIUM)),
                                  color: this._isNowShowing &&
                                          !(this._isComingSoon)
                                      ? SECONDARY_COLOR
                                      : Colors.transparent),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: MARGIN_MEDIUM,
                                      bottom: MARGIN_MEDIUM,
                                      left: MARGIN_MEDIUM_3,
                                      right: MARGIN_MEDIUM_3),
                                  child: Text(
                                    "Now Showing",
                                    style: TextStyle(
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                        fontSize: TEXT_REGULAR_2X,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isComingSoon = !_isComingSoon;

                                if (_isComingSoon) {
                                  nowShowingOrComingSoon = 'ComingSoon';
                                } else {
                                  nowShowingOrComingSoon = 'NowShowing';
                                }


                                movieBookingAppModel.getMovieList(nowShowingOrComingSoon).then((moviesList) {
                                  setState(() {
                                    this.moviesList = moviesList;
                                  });
                                }).catchError((error) {
                                  debugPrint(error.toString());
                                });


                              });
                            },
                            child: Container(
                              height: 46,
                              margin: const EdgeInsets.all(MARGIN_MEDIUM),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(MARGIN_MEDIUM)),
                                  color: (this._isComingSoon) &&
                                          !(this._isNowShowing)
                                      ? SECONDARY_COLOR
                                      : Colors.transparent),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: MARGIN_MEDIUM,
                                      bottom: MARGIN_MEDIUM,
                                      left: MARGIN_MEDIUM_3,
                                      right: MARGIN_MEDIUM_3),
                                  child: Text(
                                    "Coming Soon",
                                    style: TextStyle(
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                        fontSize: TEXT_REGULAR_2X,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: MARGIN_SMALL),
                ],
              ),
            ),
            GridMoviesListSection(
                moviesList: moviesList,
                _isNowShowing,
                onTapItemView: (MovieVO? movieVO)
                    {

                      if(movieVO != null)
                      {
                        _navigateToMovieDetailPage(context, _isNowShowing, movieVO,movieBookingAppModel);
                      }else{
                        Fluttertoast.showToast(
                            msg: "Can't go to the Move detail page.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }


                    })
          ],
        ),
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
  final List<BannerVO>? bannersList;

  BannerSectionView({required this.bannersList});

  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          child:
          (widget.bannersList != null )?
          CarouselSlider(
            options: CarouselOptions(
              height: 170.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                // print("Index $index ${reason.toString()}");
                setState(() {
                  _position = index.toDouble();
                });
              },
            ),
            items: widget.bannersList?.map((bannerVO) {
              return Builder(
                builder: (BuildContext context) {
                  return BannerItemView(bannerVO: bannerVO);
                },
              );
            }).toList(),
          ): Container(),
        ),
        SizedBox(
          height: MARGIN_SMALL,
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _position,
          decorator: const DotsDecorator(
              color: HOME_SCREEN_BANNER_DOTS_INACTIVE_COLOR,
              activeColor: SECONDARY_COLOR),
        ),
      ],
    );
  }
}

class NowShowingAndComingSoonButtonView extends StatefulWidget {
  @override
  State<NowShowingAndComingSoonButtonView> createState() =>
      _NowShowingAndComingSoonButtonViewState();
}

class _NowShowingAndComingSoonButtonViewState
    extends State<NowShowingAndComingSoonButtonView> {
  bool _nowShowing = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(102, 102, 102, 0.8),
                Color.fromRGBO(85, 85, 85, 0.4),
                Color.fromRGBO(85, 85, 85, 0.4)
              ])),
      child: Padding(
        padding: const EdgeInsets.only(left: MARGIN_MEDIUM),
        child: Row(
          children: [
            _nowShowing
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: SECONDARY_COLOR),
                    onPressed: () {
                      setState(() {
                        if (_nowShowing) {
                          _nowShowing = false;
                        } else {
                          _nowShowing = true;
                        }
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Text(
                        "Now Showing",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                : TextButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      setState(() {
                        if (!_nowShowing) {
                          _nowShowing = true;
                        } else {
                          _nowShowing = false;
                        }
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Text(
                        "Now Showing",
                        style: TextStyle(
                          color: GRAY_COLOR_2,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
            !_nowShowing
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: SECONDARY_COLOR),
                    onPressed: () {
                      setState(() {
                        if (_nowShowing) {
                          _nowShowing = false;
                        } else {
                          _nowShowing = true;
                        }
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                : TextButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      setState(() {
                        if (!_nowShowing) {
                          _nowShowing = true;
                        } else {
                          _nowShowing = false;
                        }
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 10),
                      child: Text(
                        "Coming Soon",
                        style: TextStyle(
                          color: GRAY_COLOR_2,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

class GridMoviesListSection extends StatelessWidget {
  final bool _uiChangeFlag;
  final Function(MovieVO?) onTapItemView;
  final List<MovieVO>? moviesList;

  GridMoviesListSection(this._uiChangeFlag,
      {required this.onTapItemView, required this.moviesList});

  @override
  Widget build(BuildContext context) {

    debugPrint("check movie list = ${moviesList.toString()}");

    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // mainAxisSpacing: 10,
        //  crossAxisSpacing: 10,
        childAspectRatio: 0.63, //childAspectRatio: 0.63
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          debugPrint("check movie list object = ${moviesList?.elementAt(index).toString()}");
          return MovieItemView(
              uiChangeFlag: _uiChangeFlag,
              movieListObjItem:   moviesList?.elementAt(index)        
             /* _uiChangeFlag
                  ? moviesList[index]
                  : moviesList[index]*/
              ,
                  onTapItemView: () {
            this.onTapItemView(moviesList?.elementAt(index));
          });
        },
        childCount: _uiChangeFlag
            ? moviesList?.length
            : moviesList?.length,
      ),
    );
  }
}

class BannerItemView extends StatelessWidget {
  final BannerVO? bannerVO;

  BannerItemView({Key? key, this.bannerVO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: (bannerVO?.url.toString() == "")?DecorationImage(
          image: AssetImage("assets/images/profile_bg.png"),
          fit: BoxFit.cover,
        ):DecorationImage(
      image: NetworkImage(bannerVO?.url.toString() ?? ""),
    fit: BoxFit.cover,
    ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: MARGIN_CARD_MEDIUM_2,
            top: MARGIN_CARD_MEDIUM_2,
            child: RichText(
                text: const TextSpan(
                    text: "10%",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_HEADING_1X,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                  TextSpan(
                      text: "off\n",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_SMALL,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: "with",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_SMALL,
                          fontWeight: FontWeight.w400)),
                  TextSpan(
                      text: " KBZ ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_REGULAR_1X,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: "debit card",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_SMALL,
                          fontWeight: FontWeight.w400))
                ])),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: MARGIN_CARD_MEDIUM_2,
                  top: MARGIN_CARD_MEDIUM_2,
                  bottom: MARGIN_CARD_MEDIUM_2),
              child: Image.asset(
                'assets/images/credit_card.png',
                scale: 2.15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MovieListSliverAppBarView extends StatelessWidget {
  final Function onTapBack;

  MovieListSliverAppBarView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: 64,
      // floating: true,
      pinned: true,
      //  snap: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              color: PRIMARY_COLOR,
            ),
            AppBar(
              backgroundColor: PRIMARY_COLOR,
              title: const Text(
                "Yangon",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(left: MARGIN_XLARGE),
                child: Image.asset(
                  'assets/icons/ic_location_arrow.png',
                  scale: 3,
                ),
              ),
              actions: [
                Image.asset(
                  "assets/icons/ic_search.png",
                ),
                Image.asset(
                  "assets/icons/ic_noti.png",
                ),
                Image.asset(
                  "assets/icons/ic_scanner.png",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> _navigateToMovieDetailPage(
    BuildContext context, bool _isNowShowing,
    MovieVO movieVO,
    MovieBookingAppModel movieBookingAppModel) {


  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MovieDetailPage(_isNowShowing,
        movieId: movieVO.id??0,),
    ),
  );

  ///Movie Detail data
 // return movieBookingAppModel.getMovieDetails(movieVO.id??0).then((movieDetails) {
 //
 //     // this.movieDetails = movieDetails;
 //    //  this.cast =movieDetails?.casts;
 //
 //      if(movieDetails != null)
 //        {
 //          print("not null movie detail ${movieDetails.toString()}");
 //          return Navigator.push(
 //            context,
 //            MaterialPageRoute(
 //              builder: (context) => MovieDetailPage(_isNowShowing,
 //                movieVO: movieDetails,),
 //            ),
 //          );
 //        }else{
 //        print("null movie detail");
 //        return  Fluttertoast.showToast(
 //          msg: "Fail",
 //          toastLength: Toast.LENGTH_SHORT,
 //          gravity: ToastGravity.CENTER,
 //          backgroundColor: Colors.grey,
 //          textColor: Colors.white,
 //          fontSize: 16.0
 //      );
 //      }
 //
 //
 //  }).catchError((error) {
 //   print("error movie detail");
 //  return  Fluttertoast.showToast(
 //        msg: error.toString(),
 //        toastLength: Toast.LENGTH_SHORT,
 //        gravity: ToastGravity.CENTER,
 //        backgroundColor: Colors.grey,
 //        textColor: Colors.white,
 //        fontSize: 16.0
 //    );
 //  });
}

Future<dynamic> _navigateSearchPage(
    BuildContext context, String nowShowingOrComingSoonFlag) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MovieSearchPage(nowShowingOrComingSoonFlag),
    ),
  );
}
