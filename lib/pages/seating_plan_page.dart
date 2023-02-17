import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/movie_seat_grid_list_view_obj.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/widgets/booking_date_time_status_view.dart';
import 'package:movie_booking_app/widgets/clip_button.dart';
import 'package:movie_booking_app/widgets/my_clipper.dart';

class SeatingPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: Icon(Icons.chevron_left),
      ),
      body: Container(
       // height: MediaQuery.of(context).size.height,
        color: PRIMARY_COLOR,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TitleImageView(),
              Container(
              //  height: MediaQuery.of(context).size.height *0.8,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
                    itemCount: showMovieSeatList.length,
                    itemBuilder: (BuildContext context, int index) {
                      //
                      return Container(

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: MARGIN_CARD_MEDIUM_2,),
                            PriceTextView(showMovieSeatList[index].seatingArrangement),
                            SizedBox(height: MARGIN_CARD_MEDIUM_2,),
                            SingleSeatView(showMovieSeatList[index].movieSeatGridListViewObj)
                          ],
                        ),
                      );
                      // if (index == 0 ||
                      //     index == 3 ||
                      //     index == 6 ||
                      //     index == 9) {
                      //   // for seat price
                      //   return PriceTextView(showMovieSeatList[index].seatingArrangement);
                      // } else if (index == 10 || index == 11) {
                      //   //for couple seat
                      //   return CoupleSeatView(showMovieSeatList[index].movieSeatGridListViewObj);
                      // } else {
                      //   //for single seat
                      //   return SingleSeatView(showMovieSeatList[index].movieSeatGridListViewObj);
                      // }
                    }),
              ),
              Container(
                color: Color.fromRGBO(34, 34, 34, 1),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: AvailiableView()),
                    Expanded(
                        flex: 1,
                        child: TakenView()),
                    Expanded(
                        flex: 1,
                        child: SelectionView()),

                  ],
                ),
              ),
          SizedBox(height: 15,),
        Container(
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text("2 Tickets",style: TextStyle(
                          color: Colors.white),),
                      Text("17000KS",style: TextStyle(
                          color: SECONDARY_COLOR),),

                    ],
                  ),),
              Expanded(
                flex: 1,
                  child:  Container(
                    height: 50,
                    margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                    child: ClipButton(
                      clipper: MyClipper(holeRadius: 20),
                      shadow: Shadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0.5, 0.5),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 30, right: 20, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          color: SECONDARY_COLOR,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [Text("Buy Ticket", style: TextStyle(color: Colors.black, fontSize: TEXT_REGULAR_2X,
                                fontWeight: FontWeight.w700),)]),
                      ),
                    ),
                  )),

            ],
          ),
        )
            ],
          ),
        ),
      ),
    );
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
        Positioned(
          child: Image.asset("assets/images/ellipse.png",fit: BoxFit.cover,),
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

class SingleSeatView extends StatelessWidget {
  List<MovieSeatGridListViewObject> movieSeatGridListViewObj =
  <MovieSeatGridListViewObject>[];

  SingleSeatView(this.movieSeatGridListViewObj);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:MediaQuery.of(context).size.height * 0.1,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 11, // number of columns
          mainAxisSpacing: 10, // vertical space between items
          crossAxisSpacing: 10, // horizontal space between items
          childAspectRatio: 1, // aspect ratio of each item
        ),
        // umber of items in the grid
        itemBuilder: (BuildContext context, int index) {

          if(movieSeatGridListViewObj[index].type ==  SEAT_TYPE_TEXT)
            {
              return Container(
                child:  Text(
                  movieSeatGridListViewObj[index].title.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              );
            }else if(movieSeatGridListViewObj[index].type == SEAT_TYPE_EMPTY){
            return Container(child: Spacer(),);
          }else if(movieSeatGridListViewObj[index].type == SEAT_TYPE_AVAILABLE)
            {
              return Container(
                width: 30,
                height: 30,
                child: Image.asset("assets/icons/ic_chair_available.png"),
              );
            }else if(movieSeatGridListViewObj[index].type == SEAT_TYPE_TAKEN){
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_taken.png"),
            );
          }else if(movieSeatGridListViewObj[index].type == SEAT_TYPE_SELECTION){
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_chair_your_selection.png"),
            );
          }else if(movieSeatGridListViewObj[index].type == SEAT_TYPE_GOLD_AVAILABLE){
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_couple_seat_available.png"),
            );
          }else if(movieSeatGridListViewObj[index].type == SEAT_TYPE_GOLD_TAKEN){
            return Container(
              width: 30,
              height: 30,
              child: Image.asset("assets/icons/ic_couple_seat_taken.png"),
            );
          }else{
           return Container(
             width: 30,
             height: 30,
              child: Image.asset("assets/icons/ic_chair_your_selection.png"),
            );
          }

          /*if (index == 0 || index == 10) {
            return Container(
              child:  Text(
                "A",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          else if(index == 5){
            return Container(child: Spacer(),);
          }
          else {
            return Container(
              child: Image.asset("assets/icons/ic_chair_available.png"),
            );
          }*/

        },
        itemCount: movieSeatGridListViewObj.length, // n
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
          style: TextStyle(
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
    return BookingDateTimeStatusView(
        Color.fromRGBO(136, 136, 136, 1),
        "Availiable",
        "assets/icons/ellipse_white.png",
       8.0,
        8.0
    );
  }
}

class TakenView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        Color.fromRGBO(136, 136, 136, 1),
        "Taken",
        "assets/icons/ellipse_grey.png",
        8.0,
        8.0
    );
  }
}

class SelectionView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BookingDateTimeStatusView(
        Color.fromRGBO(136, 136, 136, 1),
        "Your Selection",
        "assets/icons/ellipse_green.png",
        8.0,
        8.0
    );
  }
}