import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

//import 'package:flick_video_player/flick_video_player.dart';
import 'package:movie_booking_app/videoplayer/default_player.dart';
import 'package:movie_booking_app/viewitems/movie_information_item_view.dart';
import 'package:movie_booking_app/widgets/circle_image_view.dart';
//import 'package:video_player/video_player.dart';

class MovieDetailPage extends StatelessWidget {
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
                  Container(
                    margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                    child: Row(
                      children:[
                        MovieInformationItemView("Censor Rating","U/A"),
                        MovieInformationItemView("Release date","May 8th,2022"),
                        MovieInformationItemView("Duration","2hr 15min")

                      ] ,
                    ),
                  ),

              Container(
                margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2,
                right: MARGIN_MEDIUM_2),
                child: StoryLineView(),
              ),
              SizedBox(
                height: MARGIN_MEDIUM_2,
              ),
              Container(
                  margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2,
                      right: MARGIN_MEDIUM_2),
                  child: CastSectionView()),
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

          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: MARGIN_CARD_MEDIUM_2),
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
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
          backgroundColor: SECONDARY_COLOR,
          label: Text(
            genreText,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400),
          )),
    );
  }
}

class MovieDetailsSliverAppBarView extends StatelessWidget {
  final Function onTapBack;

  final List<String> genreList = ["Action", "Adventure", "Drama", "Animation"];

  MovieDetailsSliverAppBarView(this.onTapBack);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: 300,
      // floating: true,
      pinned: false,
      //  snap: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: MovieDetailsAppBarVideoView(),
            ),
            Positioned(
              left: 15.63,
              bottom: 15.63,
              child: Container(
                width: 125,
                height: 175,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage('assets/images/sample_grid_img_3.png'))),
              ),
            ),
            Positioned(
                bottom: -5,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width*0.6,
                  height: 175,
                 // height: MediaQuery.of(context).size.height/4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                              child: Image.asset('assets/images/ic_imbd.png')),
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
                      Wrap(
                        direction: Axis.horizontal,
                        children: genreList
                            .map(
                              (genre) => GenreChipView(genre),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                )),
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
        height: 155,
        child: Image.asset(
          'assets/images/sample_grid_img.png',
          fit: BoxFit.cover,
        ));
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
