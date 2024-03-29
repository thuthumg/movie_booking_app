import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/food_and_beverage_item_obj.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/custom_clip_button_view.dart';
import 'package:movie_booking_app/widgets/dashed_divider_view.dart';
import 'package:movie_booking_app/widgets/ticket_cancellation_alert_box_view.dart';

class TicketDetailsPage extends StatefulWidget {


  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  List<SnackVO>? selectedSnackVOList;


  TicketDetailsPage({
    required this.cinemaName,
    required this.timeslotTime,
    required this.dateString,
    required this.movieDetailsObj,
    required this.selectedSeatedVOList,
    required this.selectedSnackVOList
  });
  @override
  State<TicketDetailsPage> createState() => _TicketDetailsPageState();
}

class _TicketDetailsPageState extends State<TicketDetailsPage> {
 // bool changeHeight = (foodAndBeverageItemList.length >0) ? true : false;
  late bool changeHeight;
  @override
  void initState() {
    changeHeight = (((widget.selectedSnackVOList??[]).length) >0) ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(17, 17, 17, 1),
        title: const Text(
          "Ticket Details",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.chevron_left)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 569,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      margin: EdgeInsets.all(MARGIN_MEDIUM_3),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(MARGIN_MEDIUM_3)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "assets/images/ticket_confirmation_card_bg.png"),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Padding(
                            padding:
                            EdgeInsets.only(top: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
                            child: BookingTimePlaceAndSeatView(),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
                            child: SnackView(widget.selectedSnackVOList??[],(bool changeHeightParam){

                              setState(() {
                                this.changeHeight = changeHeightParam;
                                print("check height status = ${this.changeHeight}");
                              });
                            }),
                          ),
                          const SizedBox(height: 30,),
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: MARGIN_MEDIUM_2, right: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
                              child:
                              ConvenienceFeeAndTicketCancellationView()),
                          SizedBox(height: 10,),
                          const Padding(
                            padding: EdgeInsets.only(right: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
                            child: TotalAmountView(),
                          ),
                        ],
                      ),),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: (changeHeight && (widget.selectedSnackVOList??[]).length >0)? (300.0 + (30*(widget.selectedSnackVOList??[]).length)) : 300.0,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.only(right: 50),
                        //  child:Image.asset("assets/images/dotted_line.png"),
                        child: DashedDividerView(
                            height: 1.0, color: Colors.white30)
                    ),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: (changeHeight && (widget.selectedSnackVOList??[]).length >0)? (280.0+(30*(widget.selectedSnackVOList??[]).length)) : 280.0,
                      child: ClipSectionView())
                ],
              ),
            ),
            CancelBookingSectionView()


          ],
        ),
      ),
    );
  }
}

class CancelBookingSectionView extends StatelessWidget {
  const CancelBookingSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_LARGE,right: MARGIN_LARGE),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(REFUND_AMOUNT_TEXT,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_3X,
                    fontWeight: FontWeight.w500
                ),),
              Text("15000Ks",
                style: TextStyle(
                    color: CANCEL_COLOR,
                    fontSize: TEXT_REGULAR_4X,
                    fontWeight: FontWeight.w700
                ),)
            ],),
         Spacer(),

          Expanded(
            flex: 5,
              child:GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: CancelBookingButtonView())) ,

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
          width: CLIP_CIRCLE_SIZE,
          height: CLIP_CIRCLE_SIZE,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3), color: PRIMARY_COLOR),
        ),
        Spacer(),
        Container(
          width: CLIP_CIRCLE_SIZE,
          height: CLIP_CIRCLE_SIZE,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM_3), color: PRIMARY_COLOR),
        )
      ],
    );
  }
}
class TotalAmountView extends StatelessWidget {
  const TotalAmountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TICKET_DETAILS_AMOUNT_TOTAL_SECTION_HEIGHT,
      child: Stack(
        children: const [
          Positioned(
            left: 0,
            child: Text(
              TICKET_DETAILS_AMOUNT_TOTAL_SECTION_TEXT,
              style: TextStyle(
                  color: SECONDARY_COLOR,
                  fontSize: TEXT_REGULAR_4X,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            right: 0,
            child: Text(
              "22500Ks",
              style: TextStyle(
                  color: SECONDARY_COLOR,
                  fontSize: TEXT_REGULAR_4X,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

class ConvenienceFeeAndTicketCancellationView extends StatelessWidget {
  const ConvenienceFeeAndTicketCancellationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConvenienceFeeView(),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
          child: TicketCancellationButtonView(),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Color.fromRGBO(136, 136, 136, 1),
        ),
      ],
    );
  }
}

class ConvenienceFeeView extends StatelessWidget {
  const ConvenienceFeeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Convenience Fee",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.white,
        ),
        Spacer(),
        Text(
          "500Ks",
          style: TextStyle(
              color: Colors.white,
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class TicketCancellationButtonView extends StatelessWidget {
  const TicketCancellationButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 35,
          decoration: const BoxDecoration(
            color: CANCEL_COLOR,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: MARGIN_MEDIUM_2,
                right: MARGIN_MEDIUM_2,
                top: MARGIN_SMALL,
                bottom: MARGIN_SMALL),
            child: Row(
              children: [
                Container(
                  width: 25,
                  height: 25,
                  child: Image.asset("assets/icons/ic_ticket_cancelation.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "Ticket Cancellation policy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
        Spacer()
      ],
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return TicketCancellationAlertBoxView();
}

class SnackView extends StatefulWidget {
 // List<FoodAndBeverageItemObj> foodAndBeverageItemList = [];

  List<SnackVO> foodAndBeverageItemList = [];

  Function onTapSnackViewShowHeight;
  SnackView(this.foodAndBeverageItemList,this.onTapSnackViewShowHeight);

  @override
  State<SnackView> createState() =>
      _SnackViewState(this.foodAndBeverageItemList,this.onTapSnackViewShowHeight);
}

class _SnackViewState extends State<SnackView> {
  bool isLisShowDetails = true;
  Function onTapSnackViewShowHeight;

  //List<FoodAndBeverageItemObj> foodAndBeverageItemList = [];
  List<SnackVO> foodAndBeverageItemList = [];
  _SnackViewState(this.foodAndBeverageItemList,this.onTapSnackViewShowHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                isLisShowDetails = !this.isLisShowDetails;
                this.onTapSnackViewShowHeight(isLisShowDetails);
              });
            },
            child: FoodAndBeverageTitleViewAndTotalAmtView(isLisShowDetails)),
        Visibility(
            visible: isLisShowDetails,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: foodAndBeverageItemList.length,
              itemBuilder: (BuildContext context, int index) {
                return FoodAndBeverageListItemView(foodAndBeverageItem:
                    foodAndBeverageItemList[index]);
              },
            )),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class FoodAndBeverageListItemView extends StatelessWidget {
 // final FoodAndBeverageItemObj foodAndBeverageItemObj;
  final SnackVO foodAndBeverageItem;

  FoodAndBeverageListItemView({required this.foodAndBeverageItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 30,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: MARGIN_MEDIUM),
              width: TICKET_DETAILS_PAGE_DELETE_ICON_SIZE,
              height: TICKET_DETAILS_PAGE_DELETE_ICON_SIZE,
              child: Image.asset("assets/icons/ic_delete.png"),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "${foodAndBeverageItem.name}(Qt.${foodAndBeverageItem.quantity})",
              style: TextStyle(
                  color: GRAY_COLOR_2,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Text(
              "${foodAndBeverageItem.price}Ks",
              style: TextStyle(
                  color: GRAY_COLOR_2,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w400),
            )
          ],
        )

      // Stack(
      //   children: [
      //     Positioned(
      //       left: 0,
      //       child: Row(
      //         children: [
      //           Container(
      //             padding: EdgeInsets.only(right: MARGIN_MEDIUM),
      //             width: 25,
      //             height: 25,
      //             child: Image.asset("assets/icons/ic_delete.png"),
      //           ),
      //           const Text(
      //             "Potatoes Chips(Qt.1)",
      //             style: TextStyle(
      //                 color: Color.fromRGBO(136, 136, 136, 1),
      //                 fontSize: TEXT_REGULAR_1X,
      //                 fontWeight: FontWeight.w400),
      //           )
      //         ],
      //       ),
      //     ),
      //     const Positioned(
      //       right: 0,
      //       child: Text(
      //         "10000Ks",
      //         style: TextStyle(
      //             color: Color.fromRGBO(136, 136, 136, 1),
      //             fontSize: TEXT_REGULAR_1X,
      //             fontWeight: FontWeight.w400),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class FoodAndBeverageTitleViewAndTotalAmtView extends StatelessWidget {
  bool isLisShowDetails;

  FoodAndBeverageTitleViewAndTotalAmtView(this.isLisShowDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM),
            width: 25,
            height: 25,
            child: Image.asset("assets/icons/ic_food_and_beverage.png"),
          ),
          const Text(
            "Food and Beverage",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          ),
          isLisShowDetails
              ? Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
          )
              : Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          ),
          Spacer(),
          Text(
            "20000Ks",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class BookingTimePlaceAndSeatView extends StatelessWidget {
  const BookingTimePlaceAndSeatView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieAndTheaterDataSectionView(),
        SizedBox(
          height: 20,
        ),
        MovieDateTimeAndLocationSectionView(),
        SizedBox(
          height: 10,
        ),
        SeatTicketSectionView(),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Color.fromRGBO(136, 136, 136, 1),
        ),
      ],
    );
  }
}

class SeatTicketSectionView extends StatelessWidget {
  const SeatTicketSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: "M-Ticket(",
            style: TextStyle(
                color: Colors.white70,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                text: "2",
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
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "Gold-G8,G7",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Text(
              "20000Ks",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    );
  }
}

class MovieDateTimeAndLocationSectionView extends StatelessWidget {
  const MovieDateTimeAndLocationSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  "Sat,18 Jun, 2022",
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
                  "3:30PM",
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
    );
  }
}

class MovieAndTheaterDataSectionView extends StatelessWidget {
  const MovieAndTheaterDataSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: "Black Widow",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700),
            children: <TextSpan>[
              TextSpan(
                text: "  (3D)(U/A)",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          text: const TextSpan(
            text: "JCGV:Junction City",
            style: TextStyle(
                color: SECONDARY_COLOR,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700),
            children: <TextSpan>[
              TextSpan(
                text: "  (SCREEN 2)",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CancelBookingButtonView extends StatelessWidget {
  const CancelBookingButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 50,
     // width: MediaQuery.of(context).size.width * 0.6,
      margin: EdgeInsets.only(bottom: MARGIN_MEDIUM_3),
      child: CustomClipButtonView("Cancel Booking",CANCEL_COLOR,Colors.white),
    );
  }
}

/*Future<dynamic> _navigateToTicketPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TicketPage(),
    ),
  );
}*/
