import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/theater_booking_time_obj.dart';
import 'package:movie_booking_app/data/vos/cinema_and_show_time_by_date_vo.dart';
import 'package:movie_booking_app/data/vos/timeslots_vo.dart';
import 'package:movie_booking_app/pages/cinema_info_detail_page.dart';
import 'package:movie_booking_app/pages/seating_plan_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/booking_date_time_status_view.dart';
import 'package:movie_booking_app/widgets/booking_time_view.dart';

class BookingMovieTheatersView extends StatefulWidget {

  List<CinemaAndShowTimeByDateVO?> cinemaAndShowTimeByDateVO;
  String? selectedDateStr;

  BookingMovieTheatersView(
  {required this.cinemaAndShowTimeByDateVO,required this.selectedDateStr});


  @override
  State<BookingMovieTheatersView> createState() => _BookingMovieTheatersViewState();
}

class _BookingMovieTheatersViewState extends State<BookingMovieTheatersView> {
   int position = -1;
  var bookingTimeObjectLists = <TheaterBookingTimeObject>[];

  @override
  Widget build(BuildContext context) {

   /* for(int i=0 ; i<theaterListObjList.length; i++){

      if(position == i)
      {
        theaterListObjList[i].isSelected = ! theaterListObjList[i].isSelected;
      }else{
        theaterListObjList[i].isSelected = false;
      }

    }*/

    for(int i=0 ; i<widget.cinemaAndShowTimeByDateVO.length; i++){

      if(position == i)
      {
        widget.cinemaAndShowTimeByDateVO[i]?.isSelected = !(widget.cinemaAndShowTimeByDateVO[i]?.isSelected ?? false);
      }else{
        widget.cinemaAndShowTimeByDateVO[i]?.isSelected = false;
      }

    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: widget.cinemaAndShowTimeByDateVO.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                      onTap: (){
                        setState((){
                          position = index;
                        });
                      },
                      child: TheaterNameSpaceView(widget.cinemaAndShowTimeByDateVO[index]?.cinema??"")),
                 const Spacer(),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CinemaInfoDetailPage(),
                        ),
                      );
                    },
                    child: const Text(SEE_DETAILS_TEXT,style: TextStyle(
                      color: SECONDARY_COLOR,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,

                    ),),
                  )

                ],
              ),
              const SizedBox(height: 15,),
              Container(

                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ParkingView()),
                    Expanded(
                        flex: 1,
                        child: OnlineFoodView()),
                    Expanded(
                        flex: 1,
                        child: WheelChairView()),

                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Visibility(
                visible: widget.cinemaAndShowTimeByDateVO[index]?.isSelected ?? false,
                child: Container(
                  margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2,right: MARGIN_MEDIUM_2),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // number of columns
                      mainAxisSpacing: 30, // vertical space between items
                      crossAxisSpacing: 30, // horizontal space between items
                      childAspectRatio: 1, // aspect ratio of each item
                    ),
                    // umber of items in the grid
                    itemBuilder: (BuildContext context, int gridIndex) {
                      return GestureDetector(
                          onTap: (){
                            setState((){
                              _navigateToSeatPage(context,
                                  widget.cinemaAndShowTimeByDateVO[index]?.timeslots?[gridIndex],
                                  widget.selectedDateStr);
                            });
                          },
                          child: BookingTimeView(widget.cinemaAndShowTimeByDateVO[index]?.timeslots?[gridIndex]));
                      //Text('Item $index');
                      // BookingTimeView();

                    },
                    itemCount: widget.cinemaAndShowTimeByDateVO[index]?.timeslots?.length, // n
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(MARGIN_MEDIUM),
                    child: Icon(Icons.info_sharp, color: LONG_PRESS_ON_SHOW_TIMING_COLOR,),
                  ),

                  Text(LONG_PRESS_ON_SHOW_TIMING_TEXT,
                    style: TextStyle(
                        color: LONG_PRESS_ON_SHOW_TIMING_COLOR,
                        fontSize: TEXT_REGULAR_1X,
                        fontWeight: FontWeight.w600
                    ),)
                ],
              ),
              const SizedBox(height: 15,),
              Container(height:1,color: SLIDER_RANGE_INACTIVE_COLOR)

            ],
          ),
        );
      },
    );
  }
}

class TheaterNameSpaceView extends StatelessWidget {

  String theaterName;
  TheaterNameSpaceView(this.theaterName);
  @override
  Widget build(BuildContext context) {
    return Text(theaterName,style: const TextStyle(
        color: Colors.white,
        fontSize: TEXT_REGULAR_2X,
        fontWeight: FontWeight.w600
    ),);
  }
}


class ParkingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        LONG_PRESS_ON_SHOW_TIMING_COLOR,
        "Parking",
        'assets/icons/ic_parking.png',
        15.80,
        15.80
    );
  }
}

class OnlineFoodView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        LONG_PRESS_ON_SHOW_TIMING_COLOR,
        "Online Food",
        'assets/icons/ic_online_food.png',
        15.80,
        15.80
    );
  }
}

class WheelChairView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        LONG_PRESS_ON_SHOW_TIMING_COLOR,
        "Wheel Chair",
        'assets/icons/ic_wheel_chair.png',
        15.80,
        15.80
    );
  }
}

  Future<dynamic> _navigateToSeatPage(BuildContext context,
      TimeslotsVO? timeslot,
      String? dateString) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeatingPlanPage(bookinig_date: dateString??"",
        theater_show_timeslot_id: timeslot?.cinemaDayTimeslotId??0,),
      ),
    );
  }


