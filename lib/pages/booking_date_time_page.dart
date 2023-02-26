import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/date_list_item.dart';
import 'package:movie_booking_app/pages/seating_plan_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/booking_date_time_status_view.dart';
import 'package:movie_booking_app/widgets/booking_movie_theaters_view.dart';
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
                      child: BookingMovieTheatersView())

                ])
            ),

          ],

        ),
      )
    );
  }
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

  int position = -1;

  var currentDate = DateTime.now();


  var dates = <DateTime>[];
  var showMovieDateList = <DateListItem>[];
  void _toggleSelection(int index) {
    setState(() {
      position = index;
     // showMovieDateList[index].isSelected = !showMovieDateList[index].isSelected;
    //  print("check select after = ${showMovieDateList[index].isSelected}");
     // showMovieDateList = showMovieDateList;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(position <0)
      {
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
        showMovieDateList[0].isSelected = true;
      }else{
      for(int i=0 ; i<showMovieDateList.length; i++){

        if(position == i)
          {
            showMovieDateList[i].isSelected = true;
          }else{
          showMovieDateList[i].isSelected = false;
        }

      }
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
