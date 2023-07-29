import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_booking_app/constants/movie_seat_grid_list_view_obj.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
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
// import 'package:movie_booking_app/widgets/sample_ui.dart';

class SeatingPlanPage extends StatefulWidget {
  final String bookinig_date;

  ///data param for checkout function
  final int theater_show_timeslot_id;
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;

  SeatingPlanPage(
      {required this.bookinig_date,
        required this.theater_show_timeslot_id,
        required this.cinemaName,
        required this.timeslotTime,
        required this.dateString,
        required this.movieDetailsObj});

  @override
  State<SeatingPlanPage> createState() => _SeatingPlanPageState();
}

class _SeatingPlanPageState extends State<SeatingPlanPage> {
  // final TransformationController _transformationController = TransformationController();
  final TransformationController _transformationController =
  TransformationController();
  double _sliderValue = 0.5;

  ///State Variables
  UserDataVO? userVO;
//  List<List<SeatVO>>? showMovieSeatList;
  List<SeatVO>? showMovieSeatList;
  int totalAmount = 0;
  int totalCount = 0;
  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();

  @override
  void initState() {
    selectedSeatVOList = [];

    ///uservo from Database
    movieBookingAppModel.getUserDataFromDatabase().then((paramUserVO) {
      setState(() {
        userVO = paramUserVO;

        ///get seat data from Network
        movieBookingAppModel
            .getSeatingPlanByShowTime('Bearer ${userVO?.userToken ?? ""}',
            widget.bookinig_date, widget.theater_show_timeslot_id)
            .then((seatVOList) {
          setState(() {
            showMovieSeatList = seatVOList;
          });
        }).catchError((error) {
          showToastMessage(error.toString());
        });
      });
    }).catchError((error) {
      debugPrint("error = " + error.toString());
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
        fontSize: 16.0);
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
              child: Icon(Icons.chevron_left,color: Colors.white,)),
        ),
        body: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Container(
                  // height: MediaQuery.of(context).size.height,
                  color: PRIMARY_COLOR,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TitleImageView(),

                        InteractiveViewer(
                          transformationController: _transformationController,
                          child: SeatListView(seatList: showMovieSeatList??[],onTapSeatView: (seatVO){
                            setState(() {
                              showMovieSeatList?.map((seatObj){
                                if(seatObj.id == seatVO.id && seatObj.symbol == seatVO.symbol)
                                {
                                  seatObj.isSelected = !(seatVO.isSelected??false);
                                }
                              }).toList();

                              showMovieSeatList = showMovieSeatList;

                              List<SeatVO>? selectedData = showMovieSeatList?.where((seatObj)=> seatObj.isSelected == true).toList();

                              selectedSeatVOList = [];
                              selectedData?.forEach((element) {
                                selectedSeatVOList.add(element);
                              });


                              totalCount = selectedData?.length??0;
                              if(selectedData != null && selectedData.length > 1)
                              {
                                totalAmount = selectedData.map((seatObj) => seatObj.price).reduce((a, b) => (a?.toInt()??0)+ (b?.toInt()??0))??0;

                              }else{

                                 if(selectedData?.length == 1) {
                                   totalAmount = selectedData?[0].price??0;
                                 } else {
                                   totalAmount = 0;
                                 }
                              }
                            });

                          }),
                        ),

                      ],
                    ),
                  ),
                )),
            Container(
              child: Column(
                children: [
                  SeatColorSpecificationsView(),
                  SeekBarView(
                    sliderValue: 1,
                    transformationController: _transformationController,
                  ),
                  TotalTicketView(
                      totalAmount: totalAmount,
                      totalCount: totalCount,
                      cinemaName: widget.cinemaName,
                      timeslotTime: widget.timeslotTime,
                      dateString: widget.dateString,
                      movieDetailsObj: widget.movieDetailsObj,
                      selectedSeatedVOList: selectedSeatVOList,
                      timeslotId: widget.theater_show_timeslot_id)
                ],
              ),
            )
          ],
        )
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
  final int totalAmount, totalCount;

  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  int timeslotId;

  TotalTicketView(
      {Key? key,
        required this.totalAmount,
        required this.totalCount,
        required this.cinemaName,
        required this.timeslotTime,
        required this.dateString,
        required this.movieDetailsObj,
        required this.selectedSeatedVOList,
        required this.timeslotId})
      : super(key: key);

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
                children: [
                  Text(
                    "$totalCount ${(totalCount == 0 || totalCount == 1) ? 'Ticket' : 'Tickets'}",
                    style: const TextStyle(
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$totalAmount KS",
                    style: const TextStyle(
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

                  print("selectedSeatedVOList ${selectedSeatedVOList.toString()}");

                  _navigateToSnackPage(
                      context,
                      cinemaName,
                      timeslotTime,
                      dateString,
                      movieDetailsObj,
                      selectedSeatedVOList,
                      timeslotId);
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

class SeekBarView extends StatefulWidget {
  double sliderValue;
  TransformationController transformationController;
  // Function(double) onTapSeekBar;
  SeekBarView(
      {Key? key,
        required this.sliderValue,
        required this.transformationController
        // required this.onTapSeekBar
      })
      : super(key: key);

  @override
  State<SeekBarView> createState() => _SeekBarViewState();
}

class _SeekBarViewState extends State<SeekBarView> {
  @override
  Widget build(BuildContext context) {
    //  double _sliderValue = 1.0;
    return Container(
      // height: 20,
        child: SliderView(
          sliderValue: widget.sliderValue,
          transformationController: widget.transformationController,
        )
    );
  }
}

class SeatListView extends StatefulWidget {
  final Function(SeatVO) onTapSeatView;
  final List<SeatVO> seatList;

  SeatListView({
    Key? key,
    required this.seatList,
    required this.onTapSeatView})
      : super(key: key);

  @override
  State<SeatListView> createState() => _SeatListViewState();
}

class _SeatListViewState extends State<SeatListView> {
  @override
  Widget build(BuildContext context) {
    return  SeatView(seatVOList: widget.seatList,onTapSeatView:(seatVO){

      print("change state seat 2");
      setState(() {
        print("change state seat 2-1");
        widget.onTapSeatView(seatVO);
      });
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
  final Function(SeatVO) onTapSeatView;
  final List<SeatVO> seatVOList;

  SeatView({required this.seatVOList, required this.onTapSeatView});

  @override
  State<SeatView> createState() => _SeatViewState();
}

class _SeatViewState extends State<SeatView> {
  bool chair_available_flag = false;
  // int ticketCount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context)
          .size
          .height, //MediaQuery.of(context).size.height * 0.1
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 18, // number of columns
            mainAxisSpacing: 3.5, // vertical space between items
            crossAxisSpacing: 3.5, // horizontal space between items
            childAspectRatio: 0.47 //aspect ratio of each item
        ),
        // umber of items in the grid
        itemBuilder: (BuildContext context, int index) {
          if (widget.seatVOList[index].type == SEAT_TYPE_TEXT) {
            return Center(
              child: Text(
                widget.seatVOList[index].symbol.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (widget.seatVOList[index].type == SEAT_TYPE_EMPTY) {
            return const SizedBox(
              width: 10,
            );
          } else if (widget.seatVOList[index].type == SEAT_TYPE_AVAILABLE) {
            return GestureDetector(
              onTap: () {
                // Implement your click function here
                setState(() {
                  print("change state seat");
                  widget.onTapSeatView(widget.seatVOList[index]);
                });
               /* print('Clicked item $index');

                //  chair_available_flag = !chair_available_flag;
                //  widget.seatVOList[index].isSelected = !widget.seatVOList[index].isSelected;

                if (widget.seatVOList[index].isSelected == true) {
                  widget.seatVOList[index].isSelected = false;
                } else {
                  widget.seatVOList[index].isSelected = true;
                }
                // print("AAA ${widget.seatVOList[index].isSelected}");
                var objId = widget.seatVOList[index].id;

                if (selectedSeatVOList.isEmpty) {
                  selectedSeatVOList.add(widget.seatVOList[index]);
                } else {
                  // selectedSeatVOList.add(widget.seatVOList[index]);

                  if (widget.seatVOList[index].isSelected == true) {
                    selectedSeatVOList.add(widget.seatVOList[index]);
                  } else {
                    for (int i = 0; i < selectedSeatVOList.length; i++) {
                      if (selectedSeatVOList[i].id == objId &&
                          selectedSeatVOList[i].symbol ==
                              widget.seatVOList[index].symbol) {
                        print("remove condition");
                        selectedSeatVOList.removeAt(i);
                        break;
                      }
                    }
                  }
                }

                setState(() {
                  widget.onTapSeatView(index, selectedSeatVOList);
                  //widget.seatVOList[index].isSelected = chair_available_flag;
                });*/
              },
              child: Container(
                width: 30,
                height: 30,
                child: Image.asset(
                  "assets/icons/ic_chair_available.png",
                  color: (widget.seatVOList[index].isSelected ?? false)
                      ? SECONDARY_COLOR
                      : Colors.white,
                ),
              ),
            );
          } else if (widget.seatVOList[index].type == SEAT_TYPE_TAKEN) {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_taken.png"),
            );
          } else if (widget.seatVOList[index].type == SEAT_TYPE_SELECTION) {
            print("selection condition");
            return Container(
              width: 30,
              height: 30,
              child: Image.asset(
                "assets/icons/ic_chair_available.png",
                color: SECONDARY_COLOR,
              ),
            );
          }
          else {
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_your_selection.png"),
            );
          }
          // }
        },
        itemCount: widget.seatVOList.length,
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

Future<dynamic> _navigateToSnackPage(
    BuildContext context,
    String? cinemaName,
    String? timeslotTime,
    String? dateString,
    MovieVO? movieDetailsObj,
    List<SeatVO>? selectedSeatedVOList,
    int theaterShowTimeslotId,
    ) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SnackPage(
          cinemaName: cinemaName,
          timeslotTime: timeslotTime,
          dateString: dateString,
          movieDetailsObj: movieDetailsObj,
          selectedSeatedVOList: selectedSeatedVOList,
          theaterShowTimeslotId: theaterShowTimeslotId),
    ),
  );
}
