import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/seating_plan_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/booking_date_time_status_view.dart';
import 'package:movie_booking_app/widgets/booking_time_view.dart';
import 'package:movie_booking_app/widgets/clip_button.dart';
import 'package:movie_booking_app/widgets/date_time_card.dart';
import 'package:movie_booking_app/widgets/my_clipper.dart';

class BookingDateTimePage extends StatefulWidget {
  const BookingDateTimePage({Key? key}) : super(key: key);

  @override
  State<BookingDateTimePage> createState() => _BookingDateTimePageState();
}

class _BookingDateTimePageState extends State<BookingDateTimePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.chevron_left)),
        actions: [
          Row(
            children: [
              Image.asset(
                'assets/icons/ic_location_arrow.png',
                scale: 3,
              ),
              const Text("Yangon", style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w700
              ),)
            ],
          ),
          Image.asset(
            "assets/icons/ic_search.png",
          ),
          Container(
            // margin: EdgeInsets.only(right: MARGIN_MEDIUM_2,top: MARGIN_MEDIUM_2,bottom: MARGIN_MEDIUM_2),
            child: Image.asset(
              "assets/icons/ic_filter.png",
              scale: 4,
            ),
          ),
        ],
      ),

      body: Container(


        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 15,),
                  Container(
                      margin: EdgeInsets.only(left: MARGIN_SMALL,right: MARGIN_SMALL),
                      child: DateListView()),
                  SizedBox(height: 10,),
                  Container(
                      margin: EdgeInsets.only(left: MARGIN_MEDIUM_2,right: MARGIN_MEDIUM_2),
                      child: MovieViewType()),
                  SizedBox(height: 20,),
                  MovieBookingTimeStatus(),
                  SizedBox(height: 15,),
                  Container(
                      margin: EdgeInsets.only(left: MARGIN_MEDIUM_2,right: MARGIN_MEDIUM_2),
                      child: BookingMovieTheaters())

                ])
            ),

          ],

        ),
      ),

    );
  }
}

class TheaterBookingTimeObject{

  final String bookingTime; // 12:30PM
  final String movieViewType; // 3D IMAX
  final String screen; // Screen
  final String bookingTimeStatus;
  final String availableCountString;


  TheaterBookingTimeObject(
  this.bookingTime,
  this.movieViewType,
  this.screen,
  this.bookingTimeStatus,
  [this.availableCountString = ""]);



}
class BookingMovieTheaters extends StatefulWidget {

  // const BookingMovieTheaters({
  //   Key? key,
  // }) : super(key: key);

  @override
  State<BookingMovieTheaters> createState() => _BookingMovieTheatersState();
}

class _BookingMovieTheatersState extends State<BookingMovieTheaters> {
  bool _showDetail = false;
  var bookingTimeObjectLists = <TheaterBookingTimeObject>[];

  @override
  Widget build(BuildContext context) {

    bookingTimeObjectLists.clear();

    bookingTimeObjectLists.add(
      TheaterBookingTimeObject("9:30AM",
          "3D", "Screen1", "Disable","21 Availiable")
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
                const Text("JCGV : Junction City",style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w600
                ),),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    setState((){
                      _showDetail = !_showDetail;
                    });
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
Future<dynamic> _navigateToSeatPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SeatingPlanPage(),
    ),
  );
}
class MovieBookingTimeStatus extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(34, 34, 34, 1),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: AvailiableView()),
          Expanded(
            flex: 1,
            child: FillingFastView()),
          Expanded(
            flex: 1,
            child: AlmostFullView()),

        ],
      ),
    );

  }
}

class AlmostFullView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        ALMOST_FULL_COLOR,
        "Almost Full",
        'assets/icons/ic_almost_full.png',
      8.0,
      8.0
    );
  }
}

class FillingFastView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        FILLING_FAST_COLOR,
        "Filling Fast",
        'assets/icons/ic_filling_fast.png',
      8.0,
      8.0
    );
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

class AvailiableView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM,right: MARGIN_MEDIUM),
      child: BookingDateTimeStatusView(
        AVAILIBLE_COLOR,
        "Availiable",
        'assets/icons/ic_availiable.png',
          8.0,
          8.0
      ),
    );
  }
}

class MovieViewTypeItem{
  final String movieViewTypeName;
  bool isSelected;

  MovieViewTypeItem(this.movieViewTypeName,{this.isSelected = false});
}


class MovieViewType extends StatefulWidget {

  @override
  State<MovieViewType> createState() => _MovieViewTypeState();
}

class _MovieViewTypeState extends State<MovieViewType> {

  var movieViewTypeObjList =<MovieViewTypeItem> [];
  var movieViewTypeStringLists = ["2D","3D","3D IMAX","3D DBOX"];


  void _toggleSelection(int index) {
    setState(() {
      movieViewTypeObjList[index].isSelected = !movieViewTypeObjList[index].isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {

    movieViewTypeObjList.clear();
    for (var movieViewTypeStr in movieViewTypeStringLists) {

      movieViewTypeObjList.add(
        MovieViewTypeItem(movieViewTypeStr),
      );
      print(movieViewTypeObjList.toString());
    }

    return Container(

      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieViewTypeObjList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: ()=>_toggleSelection(index),
            child: Container(
                margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
               // width: MediaQuery.of(context).size.width * 0.2,
               // height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: movieViewTypeObjList[index].isSelected ?
                    SECONDARY_COLOR :
                    Colors.white30,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        width:1.0
                    )


                ),
                child:
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 5,bottom: 5,left: 20,right: 20),
                    child: Text(movieViewTypeObjList[index].movieViewTypeName,
                        style: TextStyle(color: Colors.white,
                          fontSize: TEXT_REGULAR,)),
                  ),
                )

            ),
          );
        },
      ),
    );
  }
}



class DateListItem {
  final String weekName;
  final String monthName;
  final String dayStr;
  bool isSelected;

  DateListItem(
      this.weekName,
      this.monthName,
      this.dayStr,
      {this.isSelected = false});

}

class DateListView extends StatefulWidget {


  @override
  State<DateListView> createState() => _DateListViewState();
}

class _DateListViewState extends State<DateListView> {

  var monthNames = [
    'January', 'February', 'March', 'April',
    'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
  ];
  var weekDayNames = [
    'MON', 'TUE', 'WED', 'THU',
    'FRI', 'SAT', 'SUN'
  ];


  var currentDate = DateTime.now();


  var dates = <DateTime>[];
  var showMovieDateList = <DateListItem>[];
  void _toggleSelection(int index) {
    setState(() {

      print("check select = ${showMovieDateList[index].isSelected}");

      showMovieDateList[index].isSelected = !showMovieDateList[index].isSelected;
      print("check select after = ${showMovieDateList[index].isSelected}");
    });
  }


  @override
  Widget build(BuildContext context) {
    //  var month = monthNames[date.month - 1];
    // var weekDay = weekDayNames[date.weekday - 1];

    showMovieDateList.clear();
    dates.clear();
    /**calculation date start */
    var twoWeeksFromNow = currentDate.add(Duration(days: 14));

    for (var date = currentDate; date.isBefore(twoWeeksFromNow);
    date = date.add(Duration(days: 1))) {
      dates.add(date);
    }
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    final tomorrow = DateTime(now.year, now.month, now.day + 1);


    for (var date in dates) {
      final aDate = DateTime(date.year, date.month, date.day);
      if(aDate == today)
        {
          showMovieDateList.add(
              DateListItem(
                  "Today",
                  (monthNames[date.month -1]).toString(),
                  (date.day).toString())
          );
        }else if (aDate == tomorrow){
        showMovieDateList.add(
            DateListItem(
                "Tomorrow",
                (monthNames[date.month -1]).toString(),
                (date.day).toString())
        );
      }else{
        showMovieDateList.add(
            DateListItem(
                (weekDayNames[date.weekday -1]).toString(),
                (monthNames[date.month -1]).toString(),
                (date.day).toString())
        );
      }
      print(showMovieDateList.toString());
    }
    /**calculation date end */

    return Container(
        height: 125,
        margin: const EdgeInsets.only(
            right: MARGIN_MEDIUM_2),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: showMovieDateList.length,
          itemBuilder: (BuildContext context, int index) {
            return DateTimeCard(
                showMovieDateList[index].weekName,
                showMovieDateList[index].monthName,
                showMovieDateList[index].dayStr,
                showMovieDateList[index].isSelected,
                (){
                  print("toggleselection");
                  _toggleSelection(index);
                });
           }
          ),
    );

  }
}
