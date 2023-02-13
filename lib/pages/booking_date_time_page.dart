import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/booking_date_time_status_view.dart';

class BookingDateTimePage extends StatelessWidget {
  const BookingDateTimePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: Icon(Icons.chevron_left),
        actions: [
          Row(
            children: [
              Image.asset(
                'assets/icons/ic_location_arrow.png',
                scale: 3,
              ),
              Text("Yangon", style: TextStyle(
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
        color: PRIMARY_COLOR,
        child: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
                  DateListView(),
                  SizedBox(height: 10,),
                  MovieViewType(),
                  SizedBox(height: 10,),
                  MovieBookingTimeStatus(),
                  SizedBox(height: 10,),
                  BookingMovieTheaters()

                ])
            )
          ],

        ),
      ),

    );
  }
}

class BookingMovieTheaters extends StatelessWidget {
  const BookingMovieTheaters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 385,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
              child:Column(
                children: [
                  Row(
                    children: [
                      Text("JCGV : Junction City",style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w600
                      ),),
                      Spacer(),
                      Text("See Details",style: TextStyle(
                          color: SECONDARY_COLOR,
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,

                      ),)
                    ],
                  ),

                  Row(
                    children: [
                      Text("JCGV : Junction City",style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w600
                      ),),
                      Spacer(),
                      Text("See Details",style: TextStyle(
                        color: SECONDARY_COLOR,
                        fontSize: TEXT_REGULAR_2X,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,

                      ),)
                    ],
                  )
                ],
              )

          );
        },
      ),
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
              child: BookingDateTimeStatusView(
                  Color.fromRGBO(170, 170, 170, 1),
                  "Parking",
                  'assets/icons/ic_parking.png'
              ),),
            Expanded(
              flex: 1,
              child: BookingDateTimeStatusView(
                  Color.fromRGBO(170, 170, 170, 1),
                  "Online Food",
                  'assets/icons/ic_online_food.png'
              ),),
          Expanded(
              flex: 1,
              child: BookingDateTimeStatusView(
                  Color.fromRGBO(170, 170, 170, 1),
                  "Wheel Chair",
                  'assets/icons/ic_wheel_chair.png'
              ),
          )
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
        'assets/icons/ic_almost_full.png'
    );
  }
}

class FillingFastView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        FILLING_FAST_COLOR,
        "Filling Fast",
        'assets/icons/ic_filling_fast.png'
    );
  }
}

class AvailiableView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
      AVAILIBLE_COLOR,
      "Availiable",
      'assets/icons/ic_availiable.png'
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
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height,
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
                    margin: const EdgeInsets.only(top: 5,bottom: 5,left: 10,right: 10),
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
    'Monday', 'Tuesday', 'Wednesday', 'Thursday',
    'Friday', 'Saturday', 'Sunday'
  ];


  var currentDate = DateTime.now();


  var dates = <DateTime>[];
  var showMovieDateList = <DateListItem>[];
  void _toggleSelection(int index) {
    setState(() {
      showMovieDateList[index].isSelected = !showMovieDateList[index].isSelected;
    });
  }


  @override
  Widget build(BuildContext context) {
    //  var month = monthNames[date.month - 1];
    // var weekDay = weekDayNames[date.weekday - 1];
    var twoWeeksFromNow = currentDate.add(Duration(days: 14));

    for (var date = currentDate; date.isBefore(twoWeeksFromNow);
    date = date.add(Duration(days: 1))) {
      dates.add(date);
    }

    for (var date in dates) {

      showMovieDateList.add(
          DateListItem(
              (weekDayNames[date.weekday -1]).toString(),
              (monthNames[date.month -1]).toString(),
              (date.day).toString())
      );
      print(showMovieDateList.toString());
    }
    return Container(
      height: 67,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: showMovieDateList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: ()=>_toggleSelection(index),
            child: Container(
                margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                    color: showMovieDateList[index].isSelected ?
                    SECONDARY_COLOR :
                    Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))

                ),
                child:
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(showMovieDateList[index].weekName,
                        style: TextStyle(color: Colors.black,
                            fontSize: TEXT_REGULAR,
                            fontWeight: FontWeight.w400),),
                      Text(showMovieDateList[index].monthName,
                          style: TextStyle(color: Colors.black,
                              fontSize: TEXT_REGULAR_1X,
                              fontWeight: FontWeight.w400)),
                      Text(showMovieDateList[index].dayStr,
                          style: TextStyle(color: Colors.black,
                              fontSize: TEXT_REGULAR_1X,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                )

            ),
          );
        },
      ),
    );
  }
}
