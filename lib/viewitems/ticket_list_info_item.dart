import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/vos/check_out_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/dashed_divider_view.dart';

class TicketListInfoItem extends StatelessWidget {

  CheckOutVO? checkOutVO;
  Function onTapTicketItem;

  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  List<SnackVO>? selectedSnackVOList;
  int theaterShowTimeslotId;
  int paymentId;

  TicketListInfoItem({
    required this.checkOutVO,
  required this.onTapTicketItem,
    required this.cinemaName,
    required this.timeslotTime,
    required this.dateString,
    required this.movieDetailsObj,
    required this.selectedSeatedVOList,
    required this.selectedSnackVOList,
    required this.theaterShowTimeslotId,
    required this.paymentId,
});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       // print("on tap ticket item");
        onTapTicketItem();
        },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                  /* width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,*/
                  // width: 100,
                  //  height: 300,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          "assets/images/ticket_confirmation_card_bg.png"),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        child: TicketConfirmationInfoView(checkOutVO: checkOutVO,
                            movieVO: movieDetailsObj,
                            cinemaName: cinemaName,
                            selectedSeatedVOList: selectedSeatedVOList),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 120,
                        child: BookingDateTimeAndLocationView(
                            dateString: dateString,
                            timeslotTime: timeslotTime),
                      )
                    ],
                  )),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 170,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  // margin: EdgeInsets.only(right: 50),
                  //  child:Image.asset("assets/images/dotted_line.png"),
                  child: DashedDividerView(height: 1.0, color: Colors.white30)

                  /* child: Divider(
                color: Colors.grey,
                thickness: 1.0,
                height: 50.0,
                indent: 20.0,
                endIndent: 20.0,
                // set the dash property to create a dashed line
                // The first value specifies the length of the dash
                // The second value specifies the space between the dashes
                // In this case, the dash is 5 pixels long and the space between the dashes is 2 pixels
                // You can adjust these values to create a different dash pattern
                // You can also adjust the color and thickness of the dashed line
                // according to your preferences.
                color: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)
                    .copyWith(
                  borderSide: BorderSide(
                    style: DashStyle.dash,
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              )*/
                  ),
            ),
            Positioned(left: 0, right: 0, top: 150, child: ClipSectionView())
          ],
        ),
      ),
    );
  }
}

class BookingDateTimeAndLocationView extends StatelessWidget {

  String? timeslotTime;
  String? dateString;

  BookingDateTimeAndLocationView({
    Key? key,
    required this.timeslotTime,
    required this.dateString
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: MARGIN_MEDIUM_2, top: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    child: Image.asset("assets/icons/ic_date.png"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${convertDateFunction(dateString??currentDate())}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    softWrap: false,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR,
                        fontWeight: FontWeight.w400),
                  ),
                  // Spacer(),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    child: Image.asset("assets/icons/ic_time.png"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${timeslotTime}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      child: Image.asset("assets/icons/ic_location_green.png"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: const Text(
                        textAlign: TextAlign.center,
                        "Q5H3+JPP, Corner of,Bogyoke Lann,Yangon",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: TEXT_REGULAR,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TicketConfirmationInfoView extends StatelessWidget {

  CheckOutVO? checkOutVO;
  MovieVO? movieVO;
  String? cinemaName;
  List<SeatVO>? selectedSeatedVOList;

  TicketConfirmationInfoView({
    Key? key,
    required this.checkOutVO,
    required this.movieVO,
    required this.cinemaName,
    required this.selectedSeatedVOList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: MARGIN_MEDIUM, top: MARGIN_CARD_MEDIUM_2, right: MARGIN_MEDIUM),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.network(
                      "${MOVIE_LIST_IMAGE_BASE_URL}${movieVO?.posterPath}"),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
                      child: RichText(
                        text: TextSpan(
                          text:movieVO?.originalTitle.toString()??"",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: TEXT_REGULAR_2X,
                              fontWeight: FontWeight.w700),
                          children: <TextSpan>[
                            TextSpan(
                              text: "  (3D)(U/A)",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: TEXT_REGULAR,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
                      child: Text(
                        cinemaName??"",
                        style: TextStyle(
                            color: SECONDARY_COLOR,
                            fontSize: TEXT_REGULAR_2X,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: MARGIN_MEDIUM),
                      child: RichText(
                        text: TextSpan(
                          text: "M-Ticket(",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: TEXT_REGULAR,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                              text: "${checkOutVO?.totalSeat}",
                              style: TextStyle(
                                  color: SECONDARY_COLOR,
                                  fontSize: TEXT_REGULAR,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: ")",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: TEXT_REGULAR,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: "${checkOutVO?.seat}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: TEXT_REGULAR_1X,
                            fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                            text: "  (SCREEN 2)",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: TEXT_REGULAR,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          //   Image.asset("assets/images/dotted_line.png")
        ],
      ),
    );
  }
}

class ClipSectionView extends StatelessWidget {
  const ClipSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: PRIMARY_COLOR),
        ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //  // margin: EdgeInsets.only(right: 50),
        // //  child:Image.asset("assets/images/dotted_line.png"),
        //     child: DashedDividerView(height: 1.0, color: Colors.grey)
        //
        //    /* child: Divider(
        //       color: Colors.grey,
        //       thickness: 1.0,
        //       height: 50.0,
        //       indent: 20.0,
        //       endIndent: 20.0,
        //       // set the dash property to create a dashed line
        //       // The first value specifies the length of the dash
        //       // The second value specifies the space between the dashes
        //       // In this case, the dash is 5 pixels long and the space between the dashes is 2 pixels
        //       // You can adjust these values to create a different dash pattern
        //       // You can also adjust the color and thickness of the dashed line
        //       // according to your preferences.
        //       color: Border.all(color: Colors.grey, width: 1.0, style: BorderStyle.solid)
        //           .copyWith(
        //         borderSide: BorderSide(
        //           style: DashStyle.dash,
        //           width: 1.0,
        //           color: Colors.grey,
        //         ),
        //       ),
        //     )*/
        // ),
        Spacer(),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: PRIMARY_COLOR),
        )
      ],
    );
  }
}

class TicketCardBackgroundView extends StatelessWidget {
  const TicketCardBackgroundView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset("assets/images/ticket_confirmation_card_bg.png"),
    );
  }
}
