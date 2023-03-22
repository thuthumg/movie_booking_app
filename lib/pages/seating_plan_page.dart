import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_booking_app/constants/movie_seat_grid_list_view_obj.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/pages/snack_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/booking_date_time_status_view.dart';
import 'package:movie_booking_app/widgets/clip_button.dart';
import 'package:movie_booking_app/widgets/my_clipper.dart';
import 'package:movie_booking_app/widgets/slider_view.dart';

class SeatingPlanPage extends StatefulWidget {

  final String bookinig_date;
  final int theater_show_timeslot_id;

  SeatingPlanPage({required this.bookinig_date,
    required this.theater_show_timeslot_id});

  @override
  State<SeatingPlanPage> createState() => _SeatingPlanPageState();
}

class _SeatingPlanPageState extends State<SeatingPlanPage> {

  ///State Variables
  UserDataVO? userVO;
  List<List<SeatVO>>? showMovieSeatList;


  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();

  @override
  void initState() {



    ///uservo from Database
    movieBookingAppModel.getUserDataFromDatabase().then((paramUserVO) {
      setState(() {
        userVO = paramUserVO;

        ///getseat data from Network
        movieBookingAppModel.getSeatingPlanByShowTime(
            'Bearer ${userVO?.userToken??""}',
            widget.bookinig_date,
            widget.theater_show_timeslot_id).then((seatVOList){

             setState(() {
               showMovieSeatList =seatVOList;
             });
        })
        .catchError((error){
          showToastMessage(error.toString());
        });

      });



    }).catchError((error) {
      debugPrint("error = "+error.toString());
    });



    super.initState();
  }
  void showToastMessage(String msgString) {
    Fluttertoast.showToast(
        msg: msgString,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.chevron_left)),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.65,
             child: Container(
                // height: MediaQuery.of(context).size.height,
                color: PRIMARY_COLOR,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TitleImageView(),
                      SeatListView(seatList: showMovieSeatList??[]),
                    ],
                  ),
                ),
              )
          ),
          Container(
           // height: MediaQuery.of(context).size.height*0.35,
           // color: PRIMARY_COLOR,
            child: Column(
              children: const [
                SeatColorSpecificationsView(),
                SeekBarView(),
                TotalTicketView()
              ],
            ),
          )
        ],
      )

      // Stack(
      //   children: [
      //     Positioned(
      //       top: 0,
      //       left: 0,
      //       right: 0,
      //       bottom: 0,
      //       child: Container(
      //         // height: MediaQuery.of(context).size.height,
      //         color: PRIMARY_COLOR,
      //         child: SingleChildScrollView(
      //           child: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               TitleImageView(),
      //               SeatListView(),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       child: Column(
      //         children: [
      //           SeatColorSpecificationsView(),
      //           SeekBarView(),
      //           TotalTicketView()
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class SeatColorSpecificationsView extends StatelessWidget {
  const SeatColorSpecificationsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(34, 34, 34, 1),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          AvailiableView(),
          Spacer(),
          TakenView(),
          Spacer(),
          SelectionView(),
        ],
      ),
    );
  }
}

class TotalTicketView extends StatelessWidget {
  const TotalTicketView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_3, bottom: MARGIN_MEDIUM_3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "2 Tickets",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "17000KS",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_4X,
                        fontWeight: FontWeight.w600,
                        color: SECONDARY_COLOR),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: () {
                  _navigateToSnackPage(context);
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.only(
                      right: MARGIN_MEDIUM_3, bottom: MARGIN_MEDIUM_3),
                  //  margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                  child: ClipButton(
                    clipper: MyClipper(holeRadius: 20),
                    shadow: const Shadow(
                      color: Colors.grey,
                      blurRadius: 2,
                      offset: Offset(0.5, 0.5),
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 30, right: 20, top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: SECONDARY_COLOR,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Buy Ticket",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: TEXT_REGULAR_2X,
                                  fontWeight: FontWeight.w700),
                            )
                          ]),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class SeekBarView extends StatelessWidget {
  const SeekBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            color: Colors.white,
          ),
          const SizedBox(
            width: 5,
          ),
          SliderView(),
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.remove,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class SeatListView extends StatefulWidget {

  final List<List<SeatVO>> seatList;

  SeatListView({
    Key? key,
    required this.seatList
  }) : super(key: key);

  @override
  State<SeatListView> createState() => _SeatListViewState();
}

class _SeatListViewState extends State<SeatListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
        itemCount: widget.seatList.length,
        itemBuilder: (BuildContext context, int index) {
          //
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(
              //   height: MARGIN_CARD_MEDIUM_2,
              // ),
             // PriceTextView( widget.seatList[index].seatingArrangement),
             //  SizedBox(
             //    height: MARGIN_CARD_MEDIUM_2,
             //  ),
              SeatView(seatVOList: widget.seatList[index])
            ],
          );
        });
  }
}

class TitleImageView extends StatelessWidget {
  const TitleImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/ellipse.png",
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            margin: EdgeInsets.only(top: 50),
            child: Text(
              "SCREEN",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}

class SeatView extends StatefulWidget {
  // List<MovieSeatGridListViewObject> movieSeatGridListViewObj =
  //     <MovieSeatGridListViewObject>[];

  final List<SeatVO> seatVOList;

  SeatView({required this.seatVOList});

  @override
  State<SeatView> createState() => _SeatViewState();
}

class _SeatViewState extends State<SeatView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08, //MediaQuery.of(context).size.height * 0.1
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.seatVOList.length, // number of columns
          mainAxisSpacing: 10, // vertical space between items
          crossAxisSpacing: 10, // horizontal space between items
          childAspectRatio:1//aspect ratio of each item
        ),
        // umber of items in the grid
        itemBuilder: (BuildContext context, int index) {
          if (widget.seatVOList[index].type == SEAT_TYPE_TEXT) {
            return Text(
              widget.seatVOList[index].symbol.toString(),
              style: TextStyle(color: Colors.white),
            );
          } else if (widget.seatVOList[index].type == SEAT_TYPE_EMPTY) {
            return SizedBox(
              width: 10,
            );
          } else if (widget.seatVOList[index].type ==
              SEAT_TYPE_AVAILABLE) {
            return GestureDetector(
              onTap: () {
                // Implement your click function here
                print('Clicked item $index');
              },
              child: Container(
                width: 30,
                height: 30,
                child: Image.asset("assets/icons/ic_chair_available.png"),
              ),
            );
          } else if (widget.seatVOList[index].type == SEAT_TYPE_TAKEN) {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_taken.png"),
            );
          } else if (widget.seatVOList[index].type ==
              SEAT_TYPE_SELECTION) {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_available.png",
                color: SECONDARY_COLOR,),
            );
          }
          //
          // else if (widget.seatVOList[index].type ==
          //     SEAT_TYPE_GOLD_AVAILABLE) {
          //   return Container(
          //     width: 30,
          //     height: 30,
          //     child: Image.asset("assets/icons/ic_couple_seat_available.png"),
          //   );
          // } else if (widget.seatVOList[index].type ==
          //     SEAT_TYPE_GOLD_TAKEN) {
          //   return Container(
          //     width: 30,
          //     height: 30,
          //     child: Image.asset("assets/icons/ic_couple_seat_taken.png"),
          //   );
          // }

          else {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_your_selection.png"),
            );
          }

        },
        itemCount: widget.seatVOList.length,
        // n
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class PriceTextView extends StatelessWidget {
  String priceText = "";

  PriceTextView(this.priceText);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 30,
        child: Text(
          priceText,
          style: const TextStyle(
              fontSize: TEXT_REGULAR_2X,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(136, 136, 136, 1)),
        ),
      ),
    );
  }
}

class AvailiableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(const Color.fromRGBO(136, 136, 136, 1),
        "Availiable", "assets/icons/ellipse_white.png", 8.0, 8.0);
  }
}

class TakenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(const Color.fromRGBO(136, 136, 136, 1),
        "Taken", "assets/icons/ellipse_grey.png", 8.0, 8.0);
  }
}

class SelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(const Color.fromRGBO(136, 136, 136, 1),
        "Your Selection", "assets/icons/ellipse_green.png", 8.0, 8.0);
  }
}

Future<dynamic> _navigateToSnackPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SnackPage(),
    ),
  );
}
