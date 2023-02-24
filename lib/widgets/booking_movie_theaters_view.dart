import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/theater_booking_time_obj.dart';
import 'package:movie_booking_app/pages/cinema_info_detail_page.dart';
import 'package:movie_booking_app/pages/seating_plan_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/booking_date_time_status_view.dart';
import 'package:movie_booking_app/widgets/booking_time_view.dart';

class BookingMovieTheatersView extends StatefulWidget {

  // const BookingMovieTheaters({
  //   Key? key,
  // }) : super(key: key);
  @override
  State<BookingMovieTheatersView> createState() => _BookingMovieTheatersViewState();
}

class _BookingMovieTheatersViewState extends State<BookingMovieTheatersView> {
  bool _showDetail = false;
  var bookingTimeObjectLists = <TheaterBookingTimeObject>[];

  @override
  Widget build(BuildContext context) {

    bookingTimeObjectLists.clear();

    bookingTimeObjectLists.add(
        TheaterBookingTimeObject("9:30AM",
            "3D", "Screen1", "Disable","21 Available")
    );
    bookingTimeObjectLists.add(
        TheaterBookingTimeObject("12:30PM",
            "3D IMAX", "Screen 1", "Available")

    );
    bookingTimeObjectLists.add(
        TheaterBookingTimeObject("12:30PM",
            "3D", "Screen 2", "Almost Full","2 Available")

    );
    bookingTimeObjectLists.add(
        TheaterBookingTimeObject("3:30PM",
            "3D", "Screen 2", "Available")

    );

    bookingTimeObjectLists.add(
        TheaterBookingTimeObject("6:30PM",
            "3D DBOX", "Screen 2", "Filling Fast","21 Available")

    );

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(height: 15,),
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      setState((){
                        _showDetail = !_showDetail;
                      });
                    },
                    child: TheaterNameSpaceView()),
               Spacer(),

                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CinemaInfoDetailPage(),
                      ),
                    );
                  },
                  child: const Text("See Details",style: TextStyle(
                    color: SECONDARY_COLOR,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,

                  ),),
                )

              ],
            ),
            SizedBox(height: 15,),
            Container(

              padding: EdgeInsets.all(10),
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
            SizedBox(height: 15,),
            Visibility(
              visible: _showDetail,
              child: Container(
                margin: EdgeInsets.only(left: MARGIN_MEDIUM_2,right: MARGIN_MEDIUM_2),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // number of columns
                    mainAxisSpacing: 30, // vertical space between items
                    crossAxisSpacing: 30, // horizontal space between items
                    childAspectRatio: 1, // aspect ratio of each item
                  ),
                  // umber of items in the grid
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: (){
                          setState((){
                            _navigateToSeatPage(context);
                          });
                        },
                        child: BookingTimeView(bookingTimeObjectLists[index]));
                    //Text('Item $index');
                    // BookingTimeView();

                  },
                  itemCount: bookingTimeObjectLists.length, // n
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),),
            SizedBox(height: 15,),
            Container(
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.info_sharp, color: Color.fromRGBO(170, 170, 170, 1),),
                  ),

                  Text("Long press on show timing to see seat class!",
                    style: TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),)
                ],
              ),
            ),
            const Divider(color: Colors.white)

          ],
        );
      },
    );
  }
}

class TheaterNameSpaceView extends StatelessWidget {
  const TheaterNameSpaceView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("JCGV : Junction City",style: TextStyle(
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
        Color.fromRGBO(170, 170, 170, 1),
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
        Color.fromRGBO(170, 170, 170, 1),
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
        Color.fromRGBO(170, 170, 170, 1),
        "Wheel Chair",
        'assets/icons/ic_wheel_chair.png',
        15.80,
        15.80
    );
  }
}

  Future<dynamic> _navigateToSeatPage(BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SeatingPlanPage(),
      ),
    );
  }


