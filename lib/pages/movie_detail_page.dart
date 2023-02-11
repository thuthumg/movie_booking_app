import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
//import 'package:flick_video_player/flick_video_player.dart';
import 'package:movie_booking_app/videoplayer/default_player.dart';
import 'package:movie_booking_app/widgets/circle_image_view.dart';
//import 'package:video_player/video_player.dart';

class MovieDetailPage extends StatelessWidget {

  final List<String> genreList = ["Action", "Adventure", "Drama","Animation"];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailsSliverAppBarView(
                  ()=> Navigator.pop(context),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(

                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/sample_grid_img_2.png',
                            width: 150,
                            height: 160,
                            fit: BoxFit.cover,),
                          SizedBox(width: MARGIN_CARD_MEDIUM_2,),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Black Widow",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: TEXT_REGULAR_1X,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(
                                      height: 30,
                                      child: Image.asset(
                                          'assets/images/ic_imbd.png')),
                                  const Text(
                                    "7.1",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontSize: TEXT_REGULAR_1X,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              const Text(
                                "2D, 3D, 3D IMAX, 3D, DBOX",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: TEXT_REGULAR_1X,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: genreList
                                    .map(
                                      (genre) => GenreChipView(genre),
                                )
                                    .toList(),
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
                  ),

                  StoryLineView(),
                  CastSectionView()



                  ]))
          ],
        ),
      ),
    );
  }
}

class CastSectionView extends StatelessWidget {
  const CastSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
          Text(
            "Cast",
            style: const TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_1X,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: MARGIN_MEDIUM,
          ),
         HorizontalCastListView(),
        ],
      )

    );
  }
}
class HorizontalCastListView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOVIE_LIST_HEIGHT,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return CircleImageView();
          }),
    );
  }
}
class GenreChipView extends StatelessWidget {
  final String genreText;

  GenreChipView(this.genreText);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Chip(
            backgroundColor: SECONDARY_COLOR,
            label: Text(
              genreText,
              style:
              const TextStyle(color: Colors.black,
                  fontWeight: FontWeight.w400),
            )),
        const SizedBox(
          width: MARGIN_SMALL,
        )
      ],
    );
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {

  final Function onTapBack;

  MovieDetailsSliverAppBarView(this.onTapBack);


  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: MOVIE_DETAILS_SCREEN_SLIVER_APP_BAR_HEIGHT,
      // floating: true,
      pinned: true,
      //  snap: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            const Positioned.fill(
              child: MovieDetailsAppBarVideoView(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:
                const EdgeInsets.only(top: MARGIN_XXLARGE, left: MARGIN_MEDIUM_2),
                child: BackButtonView(()=> onTapBack()),
              ),
            ),



          ],
        ),
      ),
    );
  }
}


class BackButtonView extends StatelessWidget {
  final Function onTapBack;

  const BackButtonView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapBack();
      },
      child: Container(
        width: MARGIN_XXLARGE,
        height: MARGIN_XXLARGE,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black54,
        ),
        child: const Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: MARGIN_XLARGE,
        ),
      ),
    );
  }
}

class MovieDetailsAppBarVideoView extends StatelessWidget {
  const MovieDetailsAppBarVideoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('assets/images/sample_grid_img_2.png',
      fit: BoxFit.cover,),
    );
      //SafeArea(child: DefaultPlayer());
  }
}

class StoryLineView extends StatelessWidget {
  const StoryLineView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
        "Story Line",
        style: const TextStyle(
        color: Colors.white,
        fontSize: TEXT_REGULAR,
        fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        const Text(
          "Seventy years before Harry Potter reading a book by Newt Scamander, author experiencing extraordinary adventures in the mysterious, the New York Association of witches.",
          style: TextStyle(color: Colors.white, fontSize: TEXT_REGULAR_2X),
        ),
      ],
    );
  }
}

