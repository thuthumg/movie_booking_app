import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/vos/check_out_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/pages/ticket_details_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/viewitems/ticket_list_info_item.dart';

class TicketListPage extends StatelessWidget {
  CheckOutVO? checkOutVO;
  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  List<SnackVO>? selectedSnackVOList;
  int theaterShowTimeslotId;
  int paymentId;


  TicketListPage({
    required this.checkOutVO,
    required this.cinemaName,
    required this.timeslotTime,
    required this.dateString,
    required this.movieDetailsObj,
    required this.selectedSeatedVOList,
    required this.selectedSnackVOList,
    required this.theaterShowTimeslotId,
    required this.paymentId
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: PRIMARY_COLOR,
          actions: [
            Container(
              // width: 30,
              //  height: 30,
              child: Image.asset("assets/icons/ic_search.png"),
            ),
            Container(
              // width: 30,
              // height: 30,
              child: Image.asset("assets/icons/ic_noti.png"),
            ),
            Container(
              // width: 30,
              //  height: 30,
              child: Image.asset("assets/icons/ic_scan.png"),
            )
          ],
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return TicketListInfoItem(
                checkOutVO: checkOutVO,
                cinemaName: cinemaName,
                timeslotTime:  timeslotTime,
                dateString:  dateString,
                movieDetailsObj:  movieDetailsObj,
                selectedSeatedVOList:  selectedSeatedVOList,
                selectedSnackVOList:  selectedSnackVOList,
                theaterShowTimeslotId:  theaterShowTimeslotId,
                paymentId:  paymentId,
                onTapTicketItem: (){
              print("ticket list page");
              _navigateToTicketDetailPage(context,
                  cinemaName,
                  timeslotTime,
                  dateString,
                  movieDetailsObj,
                  selectedSeatedVOList,
                  selectedSnackVOList);
            });
          },
        ),);
  }
}


Future<dynamic> _navigateToTicketDetailPage(BuildContext context,
    String? cinemaName,
String? timeslotTime,
String? dateString,
MovieVO? movieDetailsObj,
List<SeatVO>? selectedSeatedVOList,
List<SnackVO>? selectedSnackVOList,
) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TicketDetailsPage(
          cinemaName: cinemaName,
          timeslotTime : timeslotTime,
          dateString: dateString,
          movieDetailsObj:movieDetailsObj,
          selectedSeatedVOList: selectedSeatedVOList,
          selectedSnackVOList: selectedSnackVOList
      ),
    ),
  );
}