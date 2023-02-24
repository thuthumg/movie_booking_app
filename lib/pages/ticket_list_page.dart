import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/ticket_details_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/viewitems/ticket_list_info_item.dart';

class TicketListPage extends StatelessWidget {
  const TicketListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        appBar: AppBar(
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
            return TicketListInfoItem((){
              print("ticket list page");
              _navigateToTicketDetailPage(context);
            });
          },
        ),);
  }
}


Future<dynamic> _navigateToTicketDetailPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TicketDetailsPage(),
    ),
  );
}