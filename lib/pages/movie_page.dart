import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/movie_detail_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/viewitems/movie_item_view.dart';

class MoviePage extends StatefulWidget {

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  bool _uiChangeFlag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  BannerSectionView(),
                  const SizedBox(height: MARGIN_SMALL),
                  //  NowShowingAndComingSoonButtonView(),
                  Container(
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
                      padding: const EdgeInsets.only(
                          left: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
                      child: Row(
                        children: [
                          _uiChangeFlag
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: SECONDARY_COLOR),
                                  onPressed: () {
                                    setState(() {
                                      if (_uiChangeFlag) {
                                        _uiChangeFlag = false;
                                      } else {
                                        _uiChangeFlag = true;
                                      }
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      "Now Showing",
                                      style: TextStyle(
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                )
                              : TextButton(
                                  style: ElevatedButton.styleFrom(),
                                  onPressed: () {
                                    setState(() {
                                      if (!_uiChangeFlag) {
                                        _uiChangeFlag = true;
                                      } else {
                                        _uiChangeFlag = false;
                                      }
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Now Showing",
                                      style: TextStyle(
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  )),
                          Spacer(),
                          !_uiChangeFlag
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: SECONDARY_COLOR),
                                  onPressed: () {
                                    setState(() {
                                      if (_uiChangeFlag) {
                                        _uiChangeFlag = false;
                                      } else {
                                        _uiChangeFlag = true;
                                      }
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      "Coming Soon",
                                      style: TextStyle(
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                )
                              : TextButton(
                                  style: ElevatedButton.styleFrom(),
                                  onPressed: () {
                                    setState(() {
                                      if (!_uiChangeFlag) {
                                        _uiChangeFlag = true;
                                      } else {
                                        _uiChangeFlag = false;
                                      }
                                    });
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        top: 10,
                                        bottom: 10),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "Coming Soon",
                                      style: TextStyle(
                                        color: Color.fromRGBO(85, 85, 85, 1),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: MARGIN_SMALL),
                ],
              ),
            ),
            GridMoviesListSection(_uiChangeFlag,
                    ()=>{
              _navigateToMovieDetailPage(context)
            })
          ],
        ),
      ),
    );
  }
}

class BannerSectionView extends StatefulWidget {
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
          child: CarouselSlider(
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
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return BannerItemView();
                },
              );
            }).toList(),
          ),
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

// MaterialStateProperty<Color> getColor(Color color, Color colorPressed) {
//   getColor(Set<MaterialState> states) {
//     if (states.contains(MaterialState.focused)) {
//       return colorPressed;
//     } else {
//       return color;
//     }
//   }
//
//   return MaterialStateProperty.resolveWith(getColor);
// }

class GridMoviesListSection extends StatelessWidget {
  final bool _uiChangeFlag;
  final Function onTapItemView;

  GridMoviesListSection(this._uiChangeFlag,this.onTapItemView);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: MARGIN_MEDIUM,
          // crossAxisSpacing: 8,
          childAspectRatio: 0.63),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(left: MARGIN_MEDIUM),
              child: MovieItemView(_uiChangeFlag,(){
                this.onTapItemView();
              }),
          );
        },
        childCount: 20,
      ),
    );
  }
}

class BannerItemView extends StatelessWidget {
  const BannerItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: const DecorationImage(
          image: AssetImage('assets/images/sample_img.png'),
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

Future<dynamic> _navigateToMovieDetailPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => MovieDetailPage(),
    ),
  );
}