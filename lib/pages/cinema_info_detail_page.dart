import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/custom_chip_shape.dart';

class CinemaInfoDetailPage extends StatelessWidget {
  const CinemaInfoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PRIMARY_COLOR,
        leading: Icon(Icons.chevron_left),
          title: const Text(
            "Cinema Details",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w700),
          ),
        actions: [

          Container(
             width: 20,
              height: 20,
            margin: EdgeInsets.only(right: MARGIN_MEDIUM_3),
            child: Image.asset("assets/icons/ic_favourite.png"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VideoBannerSection(),
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
      margin: EdgeInsets.only(
        left: MARGIN_MEDIUM_2,
        right: MARGIN_MEDIUM_2
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("JCGV: Junction City",
          style: TextStyle(
            color: Colors.white,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w600
          ),),
          SizedBox(height: 10,),
          Row(
            children: [
              Expanded(
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
              ),),

              Expanded(
                flex: 1,
                child:  Container(
                  width: 30,
                  height: 30,
                  child: Image.asset("assets/icons/ic_map_location_green.png"),),),
              // Text("Q5H3+JPP, Corner of, Bogyoke Lann, Yangon",
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontSize: TEXT_REGULAR_3X,
              //       fontWeight: FontWeight.w600
              //   ),),


            ],
          ),
          SizedBox(height: 30,),
          FacilitiesSectionView(),
          SizedBox(height: 30,),
          SafetySectionView(),


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
        Text("Facilities",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600
          ),),
        Wrap(
          spacing: 4.0, // spacing between adjacent chips
          // runSpacing: 1.0,
          direction: Axis.horizontal,
          children: facilitiesItemList
              .map(
                (facilitiesItem) => FacilitiesItemView(facilitiesItem),
          )
              .toList(),
        )
        // Wrap(
        //   spacing: 8.0, // spacing between adjacent chips
        //   runSpacing: 4.0, // spacing between lines of chips
        //   children: [
        //     FacilitiesItemView(),
        //     FacilitiesItemView(),
        //     FacilitiesItemView(),
        //     FacilitiesItemView()
        //   ],
        // )

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
          padding: EdgeInsets.all(8.0),
          width: 40,
          height: 40,
          child: Image.asset(facilityItem.iconLink),
        ),
        Text(facilityItem.title,style: TextStyle(
          color: SECONDARY_COLOR,
          fontWeight: FontWeight.w500,
          fontSize: TEXT_REGULAR_1X
        ),)
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
        const Text("Safety",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600
          ),),
        const SizedBox(height: 10,),
        Wrap(
          spacing: 4.0, // spacing between adjacent chips
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
      padding: const EdgeInsets.only(top: 4.0,bottom: 4.0),
      child: CustomChip(safetyItemText,SECONDARY_COLOR,8.0),
    );
  }
}
class VideoBannerSection extends StatelessWidget {
  const VideoBannerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset("assets/images/cinema_pic.png",fit: BoxFit.cover,),),
          Align(alignment: Alignment.center,
            child: Container(
                width: 50,
                height: 50,
                child: Image.asset("assets/images/play_btn_pic.png",)),
          )
        ],
      ),
    );
  }
}
