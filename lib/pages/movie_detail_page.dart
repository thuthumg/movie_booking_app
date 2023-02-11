import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

//import 'package:flick_video_player/flick_video_player.dart';
import 'package:movie_booking_app/videoplayer/default_player.dart';
import 'package:movie_booking_app/widgets/circle_image_view.dart';
//import 'package:video_player/video_player.dart';

class MovieDetailPage extends StatelessWidget {

  final List<String> genreList = ["Action", "Adventure", "Drama", "Animation"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            MovieDetailsSliverAppBarView(
              () => Navigator.pop(context),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Row(
                    children: [
                      // Image.asset(
                      //   'assets/images/sample_grid_img_2.png',
                      //   width: 150,
                      //   height: 160,
                      //   fit: BoxFit.cover,
                      // ),
                      SizedBox(
                        width: MARGIN_CARD_MEDIUM_2,
                      ),
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
                                  child:
                                      Image.asset('assets/images/ic_imbd.png')),
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
              SizedBox(height: MARGIN_MEDIUM_2,),
              CastSectionView(),
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
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Cast",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_1X,
              fontWeight: FontWeight.bold),
        ),
        HorizontalCastListView(),
      ],
    ));
  }
}

class HorizontalCastListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: MARGIN_CARD_MEDIUM_2),
              child: CircleImageView(),
            );
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
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w400),
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
             Positioned.fill(
              child: MovieDetailsAppBarVideoView(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
                child: BackButtonView(() => onTapBack()),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
                child: ShareButtonView(() => onTapBack()),
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
      onTap: () {
        onTapBack();
      },
      child: Container(
         width: MARGIN_XLARGE,
         height: MARGIN_XLARGE,
        child: const Icon(
          Icons.chevron_left,
          color: Colors.white,
          size: MARGIN_XLARGE,
        ),
      ),
    );
  }
}

class ShareButtonView extends StatelessWidget {
  final Function onTapBack;

  const ShareButtonView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapBack();
      },
      child: Container(
        width: MARGIN_LARGE,
        height: MARGIN_LARGE,
        child: const Icon(
          Icons.share,
          color: Colors.white,
          size: MARGIN_LARGE,
        ),
      ),
    );
  }
}

class MovieDetailsAppBarVideoView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.all(20),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: AlignmentDirectional.bottomCenter,
        children: [

          Positioned.fill(
              child: Container(
            child: Image.asset(
              'assets/images/sample_grid_img_2.png',
              fit: BoxFit.cover,
            ),
          )),

          Positioned(
            bottom: -100,
           // right: 20,
            left: 10,
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/sample_grid_img_2.png',
                    ),
                  ),

                ),),

                  SizedBox(
                    width: MARGIN_CARD_MEDIUM_2,
                  ),

                ],
              ),

            ),
          ),
        ],
      ),
    );
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
      children: const [
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "Story Line",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          "In the 1970s, young Gru tries to join a group of supervillains called the Vicious 6 after they outst their leader-- the legendary figher Wild Kunckles.When the interview truns disastrous,Gru and his Minions go on the run with the Vicious 6 hot on their tails.Luckily, he finds an unlikely source of guidance-- Wild Kunckles himself-- and sonn discouvers that even bad guys need a little help from their friends.",
          style: TextStyle(color: Colors.white, fontSize: TEXT_REGULAR_2X),
        ),
      ],
    );
  }
}
