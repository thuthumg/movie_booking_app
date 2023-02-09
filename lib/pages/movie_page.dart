import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieListSliverAppBarView(
              () => Navigator.pop(context),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              BannerSectionView(),
                  const SizedBox(height: MARGIN_LARGE),
              NowShowingAndComingSoonButtonView(),
            ]))
          ],
        ),
      ),
    );

    //   CustomScrollView(
    //     slivers: [
    //       SliverList(
    //         delegate: SliverChildListDelegate([
    //           BannerSection(),
    //           SizedBox(height: 20,),
    //           NowShowingAndComingSoonSection(),
    //           SizedBox(height: 20,),
    //           GridMoviesListSection(),
    //           SizedBox(height: 20,),
    //
    //         ]),
    //
    //       )
    //     ],
    // );
  }
}

class BannerSectionView extends StatefulWidget {
  @override
  State<BannerSectionView> createState() => _BannerSectionViewState();
}

class _BannerSectionViewState extends State<BannerSectionView> {
  double _position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 3,
            //  margin: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
            child: PageView(
              onPageChanged: (page) {
                setState(() {
                  // _position = page.toDouble();
                });
              },
              children: [
                // CarouselSlider.builder(
                //   itemCount: 15,
                //   itemBuilder: (BuildContext context, int itemIndex,
                //       int pageViewIndex) {
                //     _position = pageViewIndex.toDouble();
                //     return BannerItemView();
                //   },
                //
                //   options: CarouselOptions(
                //       height: 170.0,
                //       enlargeCenterPage: true,
                //       // autoPlay: true,
                //       aspectRatio: 16 / 9,
                //       autoPlayCurve: Curves.fastOutSlowIn,
                //       enableInfiniteScroll: true,
                //       // autoPlayAnimationDuration: Duration(milliseconds: 800),
                //       viewportFraction: 0.8),
                // ),
                CarouselSlider(
                    options: CarouselOptions(
                        height: 170.0,
                        enlargeCenterPage: true,
                        // autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        // autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return BannerItemView();
                        },
                      );
                    }).toList())
                // CarouselSlider(
                //   items: const [
                //     BannerItemView(),
                //     BannerItemView(),
                //     BannerItemView(),
                //   ],
                //   options: CarouselOptions(
                //     height: 170.0,
                //     enlargeCenterPage: true,
                //     // autoPlay: true,
                //     aspectRatio: 16 / 9,
                //     autoPlayCurve: Curves.fastOutSlowIn,
                //     enableInfiniteScroll: true,
                //     // autoPlayAnimationDuration: Duration(milliseconds: 800),
                //     viewportFraction: 0.8,
                //   ),
                // )
              ],
            ),
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


class NowShowingAndComingSoonButtonView extends StatelessWidget {
  const NowShowingAndComingSoonButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
      decoration:  const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color.fromRGBO(102, 102, 102, 0.8),
                Color.fromRGBO(85, 85, 85, 0.4),
                Color.fromRGBO(85, 85, 85, 0.4)])),
      child: Padding(
        padding: const EdgeInsets.only(left: MARGIN_MEDIUM),
        child: Row(
          children: [
           ElevatedButton(onPressed: (){},
               style: ElevatedButton.styleFrom(
                   primary: SECONDARY_COLOR),
               child: Padding(
                 padding: const EdgeInsets.only(
                    left:  25,
                   right: 25,
                   top: 10,
                   bottom: 10
                 ),
                 child: Text(
                   "Now Showing",
                   style: TextStyle(
                     color: Colors.black,
                     fontSize: 16,
                     fontWeight: FontWeight.w400,
                   ),
                 ),
               )),
            TextButton(onPressed: (){},

                child: Padding(
                  padding: const EdgeInsets.only(
                      left:  25,

                  ),
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
      // child: Row(
      //     children: [
      //     SizedBox(
      //       height: 60,
      //       child: ElevatedButton(
      //
      //         style: ElevatedButton.styleFrom(
      //             primary: SECONDARY_COLOR,
      //             minimumSize: const Size.fromHeight(49)),
      //         child: const Padding(
      //           padding: EdgeInsets.only(top: 15, bottom: 15),
      //           child: Text(
      //             "Now Showing",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 16,
      //               fontWeight: FontWeight.w400,
      //             ),
      //           ),
      //         ),
      //         onPressed: () {
      //           print("Now Showing");
      //         },
      //       ),
      //     ),
      //     SizedBox(
      //       height: 60,
      //       child: ElevatedButton(
      //         style: ElevatedButton.styleFrom(
      //             primary: SECONDARY_COLOR,
      //             minimumSize: const Size.fromHeight(49)),
      //         child: const Padding(
      //           padding: EdgeInsets.only(top: 15, bottom: 15),
      //           child: Text(
      //             "Coming Soon",
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 16,
      //               fontWeight: FontWeight.w400,
      //             ),
      //           ),
      //         ),
      //         onPressed: () {
      //           print("Coming Soon");
      //         },
      //       ),
      //     )
      //   ],
      // ),

    );
  }
}
class GridMoviesListSection extends StatelessWidget {
  const GridMoviesListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



// class BannerListView extends StatelessWidget {
//   double _position = 0;
//
//   BannerItemView
//
//   @override
//   Widget build(BuildContext context) {
//     return
//   }
// }

class BannerItemView extends StatelessWidget {
  const BannerItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
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
                          fontSize: TEXT_REGULAR,
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

//CustomScrollView(
//   slivers: <Widget>[
//     const SliverAppBar(
//       pinned: true,
//       expandedHeight: 250.0,
//       flexibleSpace: FlexibleSpaceBar(
//         title: Text('Demo'),
//       ),
//     ),
//     SliverGrid(
//       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//         maxCrossAxisExtent: 200.0,
//         mainAxisSpacing: 10.0,
//         crossAxisSpacing: 10.0,
//         childAspectRatio: 4.0,
//       ),
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return Container(
//             alignment: Alignment.center,
//             color: Colors.teal[100 * (index % 9)],
//             child: Text('Grid Item $index'),
//           );
//         },
//         childCount: 20,
//       ),
//     ),
//     SliverFixedExtentList(
//       itemExtent: 50.0,
//       delegate: SliverChildBuilderDelegate(
//         (BuildContext context, int index) {
//           return Container(
//             alignment: Alignment.center,
//             color: Colors.lightBlue[100 * (index % 9)],
//             child: Text('List Item $index'),
//           );
//         },
//       ),
//     ),
//   ],
// )
