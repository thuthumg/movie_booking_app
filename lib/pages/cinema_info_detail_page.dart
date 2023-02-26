import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/videoplayer/default_player.dart';
import 'package:movie_booking_app/widgets/custom_chip_shape.dart';
import 'package:video_player/video_player.dart';

class CinemaInfoDetailPage extends StatefulWidget {
  @override
  State<CinemaInfoDetailPage> createState() => _CinemaInfoDetailPageState();
}

class _CinemaInfoDetailPageState extends State<CinemaInfoDetailPage> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      autoPlay: true,
      videoPlayerController: VideoPlayerController.network(
          "https://storage.googleapis.com/biograf-video-files/videos/dd-ep-4/mp4/v-1080p-4500k-libx264.mp4"),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PRIMARY_COLOR,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.chevron_left)),
        title: const Text(
          CINEMA_DETAILS_TEXT,
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_3X,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: MARGIN_MEDIUM_3),
              child: Image.asset(
                "assets/icons/ic_favourite.png",
                color: isFavorite ? SECONDARY_COLOR : null,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VideoBannerSection(flickManager),
            const SizedBox(
              height: MARGIN_CARD_MEDIUM_2,
            ),
            CinemaDetailsInfoView()
          ],
        ),
      ),
    );
  }
}

class CinemaDetailsInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "JCGV: Junction City",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  // textAlign: TextAlign.center,
                  "Q5H3+JPP, Corner of,Bogyoke Lann,Yangon",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_3X,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: CINEMA_DETAIL_PAGE_FACILITIES_ICON_SIZE,
                  height: CINEMA_DETAIL_PAGE_FACILITIES_ICON_SIZE,
                  child: Image.asset("assets/icons/ic_map_location_green.png"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const FacilitiesSectionView(),
          const SizedBox(
            height: 30,
          ),
          const SafetySectionView(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class FacilitiesSectionView extends StatelessWidget {
  const FacilitiesSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          FACILITIES_TEXT,
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600),
        ),
        Wrap(
          spacing: MARGIN_MEDIUM, // spacing between adjacent chips
          // runSpacing: 1.0,
          direction: Axis.horizontal,
          children: facilitiesItemList
              .map(
                (facilitiesItem) => FacilitiesItemView(facilitiesItem),
              )
              .toList(),
        )
      ],
    );
  }
}

class FacilitiesItemObject {
  String title = "";
  String iconLink = "";

  FacilitiesItemObject(this.title, this.iconLink);
}

class FacilitiesItemView extends StatelessWidget {
  final FacilitiesItemObject facilityItem;

  FacilitiesItemView(this.facilityItem);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(
              right: MARGIN_MEDIUM, top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
          width: CINEMA_DETAIL_PAGE_FACILITIES_ICON_SIZE,
          height: CINEMA_DETAIL_PAGE_FACILITIES_ICON_SIZE,
          child: Image.asset(facilityItem.iconLink),
        ),
        Text(
          facilityItem.title,
          style: const TextStyle(
              color: SECONDARY_COLOR,
              fontWeight: FontWeight.w500,
              fontSize: TEXT_REGULAR_1X),
        )
      ],
    );
  }
}

class SafetySectionView extends StatelessWidget {
  const SafetySectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          SAFETY_TEXT,
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: MARGIN_SMALL, // spacing between adjacent chips
          // runSpacing: 1.0,
          direction: Axis.horizontal,
          children: safetyList
              .map(
                (safetyItem) => SafetyChipView(safetyItem),
              )
              .toList(),
        )
      ],
    );
  }
}

class SafetyChipView extends StatelessWidget {
  final String safetyItemText;

  SafetyChipView(this.safetyItemText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: MARGIN_SMALL, bottom: MARGIN_SMALL),
      child: CustomChip(safetyItemText, SECONDARY_COLOR, MARGIN_SMALL),
    );
  }
}

class VideoBannerSection extends StatelessWidget {
  FlickManager flickManager;

  VideoBannerSection(this.flickManager);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Positioned.fill(
            child: FlickVideoPlayer(
              flickManager: flickManager,
            ),
            // Image.asset("assets/images/cinema_pic.png",fit: BoxFit.cover,),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VideoPlayerScreen(
                          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                        )

                    //     VideoPlayerScreen(
                    //   'assets/videos/sample_video2.mp4',
                    // ),
                  ),
                );*/
              },
              /* child: Container(
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/images/play_btn_pic.png",)),*/
            ),
          )
        ],
      ),
    );
  }
}
