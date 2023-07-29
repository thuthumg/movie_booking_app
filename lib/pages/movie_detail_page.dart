import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/config/config_values.dart';
import 'package:movie_booking_app/config/environment_config.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/cast_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/pages/booking_date_time_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

//import 'package:flick_video_player/flick_video_player.dart';
import 'package:movie_booking_app/videoplayer/default_player.dart';
import 'package:movie_booking_app/viewitems/movie_information_item_view.dart';
import 'package:movie_booking_app/widgets/circle_image_view.dart';
import 'package:movie_booking_app/widgets/clip_button.dart';
import 'package:movie_booking_app/widgets/custom_button_bg_view.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';
import 'package:movie_booking_app/widgets/my_clipper.dart';
import 'package:video_player/video_player.dart';
//import 'package:video_player/video_player.dart';

class MovieDetailPage extends StatefulWidget {
  bool _isNowShowing;
  final int movieId;

  MovieDetailPage(this._isNowShowing,{required this.movieId});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late FlickManager flickManager;
  ///Model
  MovieBookingAppModel _movieBookingAppModel = MovieBookingAppModelImpl();

  ///State Variables
  MovieVO? movieDetails;
  List<CastVO>? cast;


  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      autoPlay: true,
      videoPlayerController: VideoPlayerController.network(
          "https://storage.googleapis.com/biograf-video-files/videos/dd-ep-4/mp4/v-1080p-4500k-libx264.mp4"),
    );


    ///Movie Detail data
    _movieBookingAppModel.getMovieDetails(widget.movieId).then((movieDetails) {
      setState(() {
        this.movieDetails = movieDetails;
        this.cast =movieDetails?.casts;
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print("check movie detail data ${widget.movieId}");

    return Scaffold(
      body: Container(
        color: PRIMARY_COLOR,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                MovieDetailsSliverAppBarView(
                  onTapBack: () => Navigator.pop(context),
                  flickManager: flickManager,
                  movieVO: movieDetails,
                ),

                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    margin: EdgeInsets.only(left: MARGIN_MEDIUM_2,top: MARGIN_MEDIUM_2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MovieInformationItemView("Censor Rating", "U/A"),
                        MovieInformationItemView(
                            "Release date", "May 8th,2022"),
                        MovieInformationItemView("Duration", "2hr 15min")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: MARGIN_MEDIUM_2,
                  ),
                      Visibility(
                        visible: !(this.widget._isNowShowing),
                        child: Container(
                            margin: const EdgeInsets.only(
                                left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                            child: ReleaseingNotiView(),),
                      ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                    child: StoryLineView(storyLineStr:movieDetails?.overview),
                  ),
                  const SizedBox(
                    height: MARGIN_MEDIUM_2,
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
                      child: CastSectionView(castVOList:movieDetails?.casts)),
                  const SizedBox(
                    height: MARGIN_XXLARGE,
                  ),
                ]))
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                //color: Colors.black87,
               // height: 40,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 80, right: 80),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black87,
                      Colors.black87
                    ],
                  ),
                ),

                child:

                GestureDetector(
                  onTap: ()=> _navigateToBookingDateTimePage(context,movieDetails),
                  child: Container(
                    height: 50,
                    margin: EdgeInsets.only(bottom: MARGIN_MEDIUM_2),
                    child: ClipButton(
                      clipper: MyClipper(holeRadius: 20),
                      shadow: Shadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0.5, 0.5),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 30, right: 20, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          color: SECONDARY_COLOR,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Text("Booking", style: TextStyle(color: Colors.black, fontSize: TEXT_REGULAR_2X,
                                fontWeight: FontWeight.w700),)]),
                      ),
                    ),
                  ),
                )

                // CustomButtonBgView(
                //   circleTopLeftPadding: 15,
                //   circleTopRightPadding: 15,
                //   circleWH: 28.0,
                //   circleRadius: 14.0,
                //   rectBgHeight: 60.0,
                //   rectBgLeftPadding: 10.5,
                //   rectBgRightPadding: 10.5,
                //   rectBgColor: SECONDARY_COLOR,
                //   rectBorderRadius: 8.0,
                //   circleColor: Colors.black,
                //   textDesc: "Booking",
                // ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
Future<dynamic> _navigateToBookingDateTimePage(BuildContext context, MovieVO? movieDetails) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BookingDateTimePage(movieDetailsObj:movieDetails),
    ),
  );
}
class ReleaseingNotiView extends StatelessWidget {
  const ReleaseingNotiView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(255, 255, 255, 0.6),
            Color.fromRGBO(204, 204, 204, 0.6),
            Color.fromRGBO(221, 221, 221, 0.3)
          ],
        ),
        //more than 50% of width makes circle
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(MARGIN_MEDIUM_3),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Releasing in 5 days",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Get notify as soon as movie \nbooking opens up in your city!",
                    style: TextStyle(
                        color: Color.fromRGBO(200, 200, 200, 1),
                        fontSize: TEXT_REGULAR_1X,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButtonView(
                    buttonContainerBgColor: Color.fromRGBO(0, 255, 106, 1),
                    buttonContainerHeight: 35,
                    buttonContainerRadius: BORDER_RADIUS,
                    iconPadding: MARGIN_MEDIUM,
                    iconWidthHeight: 35,
                    textColor: Colors.black,
                    textDesc: "Set Notification",
                    textFontSize: TEXT_REGULAR_1X,
                    iconPath: 'assets/icons/ic_notifications.png',
                    isShowIcon: true,
                    () {},
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.all(MARGIN_MEDIUM_3),
              child: Image.asset(
                'assets/images/notification_photo.png',
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CastSectionView extends StatelessWidget {

  final List<CastVO>? castVOList;

  const CastSectionView({
    Key? key,
    required this.castVOList
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
        (MOVIE_DETAIL_ACTOR_UI[EnvironmentConfig.CONFIG_MOVIE_DETAIL_ACTORS_UI] == "List")?
        HorizontalCastListView(castVOList: castVOList):
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Wrap(
            children: (castVOList??[]).map((value) {
              return CircleImageView(strProfile:value.profilePath);
            }).toList(),
          ),
        )

      ],
    ));
  }
}

class HorizontalCastListView extends StatelessWidget {

  final List<CastVO>? castVOList;

  HorizontalCastListView({this.castVOList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: castVOList?.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: MARGIN_CARD_MEDIUM_2),
              child: CircleImageView(strProfile:castVOList?.elementAt(index).profilePath),
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
  final MovieVO? movieVO;

 // final List<String> genreList = ["Action", "Adventure", "Drama", "Animation"];


  FlickManager flickManager;

  MovieDetailsSliverAppBarView(


      {required this.onTapBack,
        required  this.flickManager,
        required this.movieVO});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: PRIMARY_COLOR,
      expandedHeight: 350,
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
              child: MovieDetailsAppBarVideoView(flickManager),
            ),
            Positioned(
              left: 15.63,
              bottom: 0,
              child: Container(
                width: 125,
                height: 175,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            NetworkImage('${MOVIE_LIST_IMAGE_BASE_URL}${movieVO?.posterPath}'))),
              ),
            ),
            Positioned(
                bottom: -10,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 175,
                  // height: MediaQuery.of(context).size.height/4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                           movieVO?.originalTitle??"",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: TEXT_REGULAR_1X,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                              height: 30,
                              child: Image.asset('assets/images/ic_imbd.png')),
                          Text(
                            '${movieVO?.rating}',
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: TEXT_REGULAR_1X,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Text(
                        movieVO?.getGenreListAsCommaSeparatedString() ?? "",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: TEXT_REGULAR_1X,
                            fontWeight: FontWeight.w500),
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        children: (movieVO?.getGenreListAsStringList() ?? [])
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

  FlickManager flickManager;

  MovieDetailsAppBarVideoView(this.flickManager);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: FlickVideoPlayer(
          flickManager: flickManager,
        ),

        // Image.asset(
        //   'assets/images/sample_movie_venom_img.png',
        //   fit: BoxFit.cover,
        // ),
    );
  }
}

class StoryLineView extends StatelessWidget {

  final String? storyLineStr;
  const StoryLineView({
    Key? key,
    this.storyLineStr
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        const Text(
          "Story Line",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          storyLineStr??"",
          style: TextStyle(color: Colors.white, fontSize: TEXT_REGULAR_2X),
        ),
      ],
    );
  }
}
