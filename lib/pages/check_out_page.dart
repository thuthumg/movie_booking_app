import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking_app/constants/food_and_beverage_item_obj.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/pages/ticket_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';
import 'package:movie_booking_app/widgets/custom_clip_button_view.dart';
import 'package:movie_booking_app/widgets/dashed_divider_view.dart';
import 'package:movie_booking_app/widgets/my_separator_view.dart';
import 'package:movie_booking_app/widgets/ticket_cancellation_alert_box_view.dart';

class CheckOutPage extends StatefulWidget {
  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  List<SnackVO>? selectedSnackVOList;
  int theaterShowTimeslotId;

  CheckOutPage(
      {required this.cinemaName,
      required this.timeslotTime,
      required this.dateString,
      required this.movieDetailsObj,
      required this.selectedSeatedVOList,
      required this.selectedSnackVOList,
      required this.theaterShowTimeslotId});

  @override
  // State<CheckOutPage> createState() => _CheckOutPageState(this.changeHeight);
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  late bool changeHeight;

  // _CheckOutPageState(this.changeHeight);

  @override
  void initState() {
    changeHeight =
        (((widget.selectedSnackVOList ?? []).length) > 0) ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(17, 17, 17, 1),
        title: const Text(
          "Checkout",
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
              height: 600.0,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      margin: EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                              "assets/images/ticket_confirmation_card_bg.png"),
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MARGIN_MEDIUM_2,
                                right: MARGIN_MEDIUM_2,
                                left: MARGIN_MEDIUM_2),
                            child: BookingTimePlaceAndSeatView(
                              cinemaName: widget.cinemaName,
                              timeslotTime: widget.timeslotTime,
                              dateString: widget.dateString,
                              movieDetailsObj: widget.movieDetailsObj,
                              selectedSeatedVOList: widget.selectedSeatedVOList,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
                            //foodAndBeverageItemList
                            child: SnackView(widget.selectedSnackVOList ?? [],
                                (bool changeHeightParam) {
                              setState(() {
                                this.changeHeight = changeHeightParam;
                                print(
                                    "check height status = ${this.changeHeight}");
                              });
                            }),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Padding(
                              padding: EdgeInsets.only(
                                  top: MARGIN_MEDIUM_2,
                                  right: MARGIN_MEDIUM_2,
                                  left: MARGIN_MEDIUM_2),
                              child: ConvenienceFeeAndTicketCancellationView()),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
                            child: TotalAmountView(
                                selectedSnackVOList: widget.selectedSnackVOList,
                                selectedSeatedVOList:
                                    widget.selectedSeatedVOList),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: (changeHeight &&
                            (widget.selectedSnackVOList?.length ?? 0) > 0)
                        ? (300.0 +
                            (30 * (widget.selectedSnackVOList?.length ?? 0)))
                        : 300.0,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.only(right: 50),
                        //  child:Image.asset("assets/images/dotted_line.png"),
                        child: DashedDividerView(
                            height: 1.0, color: Colors.white30)),
                  ),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: (changeHeight &&
                              (widget.selectedSnackVOList?.length ?? 0) > 0)
                          ? (280.0 +
                              (30 * (widget.selectedSnackVOList?.length ?? 0)))
                          : 280.0,
                      child: ClipSectionView())
                ],
              ),
            ),
            ContinueButtonView(
              cinemaName: widget.cinemaName,
              timeslotTime: widget.timeslotTime,
              dateString: widget.dateString,
              movieDetailsObj: widget.movieDetailsObj,
              selectedSeatedVOList: widget.selectedSeatedVOList,
              selectedSnackVOList: widget.selectedSnackVOList,
              theaterShowTimeslotId: widget.theaterShowTimeslotId,
            ),
          ],
        ),
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

class TotalAmountView extends StatelessWidget {
  List<SeatVO>? selectedSeatedVOList;
  List<SnackVO>? selectedSnackVOList;

  TotalAmountView({
    Key? key,
    this.selectedSeatedVOList,
    this.selectedSnackVOList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var totalPrice = getSeatVOCalculatePrice(selectedSeatVOList) +
        getSnackVOCalculatePrice(selectedSnackVOList ?? []) +
        500;

    return Container(
      height: 40,
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            child: Text(
              "Total",
              style: TextStyle(
                  color: SECONDARY_COLOR,
                  fontSize: TEXT_REGULAR_4X,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            right: 0,
            child: Text(
              "${totalPrice}Ks",
              style: const TextStyle(
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
            color: Color.fromRGBO(255, 107, 0, 1),
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

  List<SnackVO> snackVOList = [];
  Function onTapSnackViewShowHeight;

  SnackView(this.snackVOList, this.onTapSnackViewShowHeight);

  @override
  State<SnackView> createState() =>
      _SnackViewState(this.snackVOList, this.onTapSnackViewShowHeight);
}

class _SnackViewState extends State<SnackView> {
  bool isLisShowDetails = true;
  Function onTapSnackViewShowHeight;

  List<SnackVO> snackVOList = [];

  _SnackViewState(this.snackVOList, this.onTapSnackViewShowHeight);

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
            child: FoodAndBeverageTitleViewAndTotalAmtView(
                snackVOList: snackVOList, isLisShowDetails: isLisShowDetails)),
        Visibility(
            visible: isLisShowDetails,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snackVOList.length,
              itemBuilder: (BuildContext context, int index) {
                return FoodAndBeverageListItemView(
                    foodAndBeverageItemObj: snackVOList[index],
                onTapDelete: (snackId){
                      setState(() {
                        snackVOList.remove(snackId);
                      });
                },);
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
  final SnackVO foodAndBeverageItemObj;

  Function(int?) onTapDelete;

  FoodAndBeverageListItemView(
      {required this.foodAndBeverageItemObj, required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
        //  height: 30,
        child: Row(
      children: [
        GestureDetector(
          onTap: () {
            onTapDelete(foodAndBeverageItemObj.id);
          },
          child: Container(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM),
            width: 25,
            height: 25,
            child: Image.asset("assets/icons/ic_delete.png"),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "${foodAndBeverageItemObj.name}(Qt.${foodAndBeverageItemObj.quantity})",
          style: const TextStyle(
              color: Color.fromRGBO(136, 136, 136, 1),
              fontSize: TEXT_REGULAR_1X,
              fontWeight: FontWeight.w400),
        ),
        Spacer(),
        Text(
          "${foodAndBeverageItemObj.price}Ks",
          style: const TextStyle(
              color: Color.fromRGBO(136, 136, 136, 1),
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
  List<SnackVO> snackVOList;

  FoodAndBeverageTitleViewAndTotalAmtView(
      {required this.snackVOList, required this.isLisShowDetails});

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
              ? const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
          Spacer(),
          Text(
            "${getSnackVOCalculatePrice(snackVOList)}Ks",
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
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;

  BookingTimePlaceAndSeatView(
      {Key? key,
      required this.cinemaName,
      required this.timeslotTime,
      required this.dateString,
      required this.movieDetailsObj,
      required this.selectedSeatedVOList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieAndTheaterDataSectionView(
            cinemaName: cinemaName, movieDetailsObj: movieDetailsObj),
        SizedBox(
          height: 20,
        ),
        MovieDateTimeAndLocationSectionView(
            timeslotTime: timeslotTime, dateString: dateString),
        SizedBox(
          height: 10,
        ),
        SeatTicketSectionView(selectedSeatedVOList: selectedSeatedVOList),
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
  List<SeatVO>? selectedSeatedVOList;

  SeatTicketSectionView({Key? key, required this.selectedSeatedVOList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "M-Ticket(",
            style: TextStyle(
                color: Colors.white70,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                text: selectedSeatedVOList?.length.toString(),
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
              getSeatVOAsCommaSeparatedString(selectedSeatedVOList ?? []),
              //??"Gold-G8,G7"
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_2X,
                  fontWeight: FontWeight.w600),
            ),
            Spacer(),
            Text(
              "${getSeatVOCalculatePrice(selectedSeatVOList)}Ks",
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
  String? timeslotTime;
  String? dateString;

  MovieDateTimeAndLocationSectionView(
      {Key? key, required this.timeslotTime, required this.dateString})
      : super(key: key);

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
                  convertDateFunction(dateString ?? currentDate()),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: false,
                  style: const TextStyle(
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
                  timeslotTime ?? "3:30PM",
                  style: const TextStyle(
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
  String? cinemaName;
  MovieVO? movieDetailsObj;

  MovieAndTheaterDataSectionView(
      {Key? key, required this.cinemaName, required this.movieDetailsObj})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: movieDetailsObj?.originalTitle.toString(),
            style: const TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700),
            children: const <TextSpan>[
              TextSpan(
                text: "  (3D)(U/A)", //?
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
          text: TextSpan(
            text: cinemaName,
            style: const TextStyle(
                color: SECONDARY_COLOR,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700),
            children: const <TextSpan>[
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

class ContinueButtonView extends StatelessWidget {
  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  List<SnackVO>? selectedSnackVOList;
  int theaterShowTimeslotId;

  ContinueButtonView(
      {Key? key,
      required this.cinemaName,
      required this.timeslotTime,
      required this.dateString,
      required this.movieDetailsObj,
      required this.selectedSeatedVOList,
      required this.selectedSnackVOList,
      required this.theaterShowTimeslotId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.only(bottom: MARGIN_XLARGE),
        child: GestureDetector(
            onTap: () {
              _navigateToTicketPage(
                  context,
                  cinemaName,
                  timeslotTime,
                  dateString,
                  movieDetailsObj,
                  selectedSeatedVOList,
                  selectedSnackVOList,
                  theaterShowTimeslotId);
            },
            child: CustomClipButtonView(
                "Continue", SECONDARY_COLOR, Colors.black)),
      ),
    );
  }
}

Future<dynamic> _navigateToTicketPage(
    BuildContext context,
    String? cinemaName,
    String? timeslotTime,
    String? dateString,
    MovieVO? movieDetailsObj,
    List<SeatVO>? selectedSeatedVOList,
    List<SnackVO>? selectedSnackVOList,
    int theaterShowTimeslotId) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TicketPage(
          cinemaName: cinemaName,
          timeslotTime: timeslotTime,
          dateString: dateString,
          movieDetailsObj: movieDetailsObj,
          selectedSeatedVOList: selectedSeatedVOList,
          selectedSnackVOList: selectedSnackVOList,
          theaterShowTimeslotId: theaterShowTimeslotId),
    ),
  );
}
