import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking_app/constants/date_list_item.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/cinema_and_show_time_by_date_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/booking_date_time_status_view.dart';
import 'package:movie_booking_app/widgets/booking_movie_theaters_view.dart';
import 'package:movie_booking_app/widgets/date_time_card.dart';

class BookingDateTimePage extends StatefulWidget {

  MovieVO? movieDetailsObj;

  BookingDateTimePage({Key? key,required this.movieDetailsObj}) : super(key: key);

  @override
  State<BookingDateTimePage> createState() => _BookingDateTimePageState();
}

class _BookingDateTimePageState extends State<BookingDateTimePage> {

  ///Model
  MovieBookingAppModel _movieBookingAppModel = MovieBookingAppModelImpl();

  ///State Variables
  UserDataVO? userVO;

  List<CinemaAndShowTimeByDateVO>? cinemaAndShowTimeByDateVO;
  String? selectedDateStr;

  String currentDate() {
    var now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  @override
  void initState() {

    ///userdata from Network
    _movieBookingAppModel.getUserDataFromDatabase().then((paramUserVO) {
      print("check user VO from timeslot page ${paramUserVO?.userToken}");
    setState(() {
      userVO = paramUserVO;
      selectedDateStr = currentDate();
      ///cinema date time list from Network
      _movieBookingAppModel.getCinemaAndShowTimeByDate(
          'Bearer ${userVO?.userToken??""}',
          currentDate()).then((paramCinemaAndShowTimeByDateVO){
        setState(() {
          cinemaAndShowTimeByDateVO = paramCinemaAndShowTimeByDateVO;
        });

      }).catchError((error) {
        showToastMessage(error.toString());
      });


    });
      print("check user VO from timeslot page 2 ${userVO?.userToken}");
    }).catchError((error) {
      showToastMessage(error.toString());
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

    print("check user VO from timeslot page 3 ${userVO?.userToken}");


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

      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: SIZE_BOX_HEIGHT_MEDIUM,),
                Container(
                    margin: const EdgeInsets.only(left: MARGIN_SMALL,right: MARGIN_SMALL),
                    child: DateListView((String paramDateStr){
                      setState(() {
                        selectedDateStr = paramDateStr;
                        ///cinema date time list from Network
                        _movieBookingAppModel.getCinemaAndShowTimeByDate(
                            'Bearer ${userVO?.userToken??""}',
                            paramDateStr).then((paramCinemaAndShowTimeByDateVO){
                          setState(() {
                            cinemaAndShowTimeByDateVO = paramCinemaAndShowTimeByDateVO;
                          });

                        }).catchError((error) {
                          showToastMessage(error.toString());
                        });
                      });
                    })),
                const SizedBox(height: SIZE_BOX_HEIGHT_SMALL,),
                Container(
                    margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2,right: MARGIN_MEDIUM_2),
                    child: MovieViewType()),
                const SizedBox(height: SIZE_BOX_HEIGHT_MEDIUM_1,),
                MovieBookingTimeStatus(),
                const SizedBox(height: SIZE_BOX_HEIGHT_MEDIUM,),
                Container(
                    margin: const EdgeInsets.only(left: MARGIN_MEDIUM_2,right: MARGIN_MEDIUM_2),
                    child: BookingMovieTheatersView(cinemaAndShowTimeByDateVO: cinemaAndShowTimeByDateVO??[],
                        selectedDateStr: selectedDateStr,movieDetailsObj: widget.movieDetailsObj,))

              ])
          ),

        ],

      )
    );
  }
}
class MovieBookingTimeStatus extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BOOKING_TIME_STATUS_COLOR,
      padding: const EdgeInsets.all(MARGIN_MEDIUM_1),
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
      MARGIN_MEDIUM, MARGIN_MEDIUM
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
        MARGIN_MEDIUM,
        MARGIN_MEDIUM
    );
  }
}

class ParkingView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        FACILITIES_TEXT_COLOR,
        PARKING_TEXT,
        'assets/icons/ic_parking.png',
        FACILITIES_ICON_SIZE,
        FACILITIES_ICON_SIZE
    );
  }
}

class OnlineFoodView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        FACILITIES_TEXT_COLOR,
        ONLINE_FOOD_TEXT,
        'assets/icons/ic_online_food.png',
        FACILITIES_ICON_SIZE,
        FACILITIES_ICON_SIZE
    );
  }
}

class WheelChairView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        FACILITIES_TEXT_COLOR,
        WHEEL_CHAIR_TEXT,
        'assets/icons/ic_wheel_chair.png',
        FACILITIES_ICON_SIZE,
        FACILITIES_ICON_SIZE
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
          AVAILIABLE_TEXT,
        'assets/icons/ic_availiable.png',
          MARGIN_MEDIUM,
          MARGIN_MEDIUM
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
      height: MOVIE_VIEW_TYPE_HEIGHT,
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
                        color: Colors.white,
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

  final Function(String) onTapDateListView;


  DateListView(this.onTapDateListView);

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
  void _toggleSelection(int index, String dateTimeStr) {
    setState(() {
      position = index;

      widget.onTapDateListView(dateTimeStr);

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
                    (date.day).toString(),'${date.year}-${date.month}-${date.day}')
            );
          }else if (aDate == tomorrow){
            showMovieDateList.add(
                DateListItem(
                    "Tomorrow",
                    (monthNames[date.month -1]).toString(),
                    (date.day).toString(),'${date.year}-${date.month}-${date.day}')
            );
          }else{
            showMovieDateList.add(
                DateListItem(
                    (weekDayNames[date.weekday -1]).toString(),
                    (monthNames[date.month -1]).toString(),
                    (date.day).toString(),'${date.year}-${date.month}-${date.day}')
            );
          }
          print(showMovieDateList.toString());
        }
        showMovieDateList[0].isSelected = true;
       // print("check date list ${showMovieDateList[0].}")


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
                 // print("toggleselection");
                  _toggleSelection(index, showMovieDateList[index].dateTimeStr);
                });
           }
          ),
    );

  }
}
