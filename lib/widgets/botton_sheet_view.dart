import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/snack_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/total_amount_button_view.dart';

class BottomSheetView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        padding: EdgeInsets.only(
            left: MARGIN_MEDIUM_3,
            right: MARGIN_MEDIUM_3,
        top: MARGIN_MEDIUM_3),
        child: Column(
          children: [
            SnackListView(),
            TotalAmountButtonView((){ Navigator.of(context).pop();},(){
              Navigator.of(context).pop();
            },true)
          ],
        )
        // Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     FoodAndBeverageEachItemView(),
        //     Row(
        //       children: [
        //         Expanded(
        //           flex: 1,
        //           child: Text(
        //             "Large Cola",
        //             style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: TEXT_REGULAR,
        //                 fontWeight: FontWeight.w500),
        //           ),
        //         ),
        //         Expanded(
        //           flex: 2,
        //           child: Container(
        //             margin: EdgeInsets.all(10),
        //             child: Row(
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   Container(
        //                     padding: EdgeInsets.only(top : 8.0,bottom: 8.0),
        //                     width: 50,
        //                     height: 50,
        //                     child: Image.asset("assets/icons/ic_plus.png"),
        //                   ),
        //                   Container(
        //                     padding: EdgeInsets.only(top : 8.0,bottom: 8.0),
        //                    // width: 50,
        //                     height: 50,
        //                     child: Text(
        //                       textAlign:TextAlign.center,
        //                       "1",
        //                       style: TextStyle(
        //                           fontSize: TEXT_REGULAR_1X,
        //                           color: SECONDARY_COLOR,
        //                           fontWeight: FontWeight.w700),
        //                     ),
        //                   ),
        //                   Container(
        //                     padding: EdgeInsets.only(top : 8.0,bottom: 8.0),
        //                     width: 50,
        //                     height: 50,
        //                     child: Image.asset("assets/icons/ic_minus.png"),
        //                   ),
        //                 ]),
        //           ),
        //         ),
        //         Expanded(
        //           flex: 1,
        //           child: Text(
        //             "1000Ks",
        //             style: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: TEXT_REGULAR,
        //                 fontWeight: FontWeight.w500),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        );
  }
}



class SnackListView extends StatelessWidget {
  const SnackListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return FoodAndBeverageEachItemView();
          }),
    );
  }
}

class FoodAndBeverageEachItemView extends StatelessWidget {
  const FoodAndBeverageEachItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Container(
       // margin: EdgeInsets.only(top:10,bottom: 10,left: 10,right: 10),
        child:
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
              child: const Text(
                "Large Cola",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.only(
                  //     top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/icons/ic_plus.png"),
                ),
                Container(
                  padding: const EdgeInsets.only(
                      top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
                 // width: 50,
                  height: 50,
                  child: const Text(
                    "1",
                    style: TextStyle(
                        fontSize: TEXT_REGULAR_2X,
                        color: SECONDARY_COLOR,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  // padding: EdgeInsets.only(
                  //     top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
                  width: 50,
                  height: 50,
                  child: Image.asset("assets/icons/ic_minus.png"),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(
                  top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
              child: const Text(
                "1000Ks",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        // Stack(
        //   children: [
        //     Positioned(
        //       top: 0,
        //       left: 0,
        //       child: Text(
        //         "Large Cola",
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: TEXT_REGULAR_2X,
        //             fontWeight: FontWeight.w500),
        //       ),
        //     ),
        //     Positioned(
        //       top: 0,
        //       child: Container(
        //       margin:EdgeInsets.only(left:100,
        //       right: MARGIN_MEDIUM_3),
        //
        //         child: Row(
        //           // crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             Container(
        //               padding: EdgeInsets.only(
        //                   top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
        //               width: 50,
        //               height: 50,
        //               child: Image.asset("assets/icons/ic_plus.png"),
        //             ),
        //             Container(
        //               padding: EdgeInsets.only(
        //                   top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
        //               // width: 50,
        //               height: 50,
        //               child: Text(
        //                 textAlign: TextAlign.center,
        //                 "1",
        //                 style: TextStyle(
        //                     fontSize: TEXT_REGULAR_1X,
        //                     color: SECONDARY_COLOR,
        //                     fontWeight: FontWeight.w700),
        //               ),
        //             ),
        //             Container(
        //               padding: EdgeInsets.only(
        //                   top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
        //               width: 50,
        //               height: 50,
        //               child: Image.asset("assets/icons/ic_minus.png"),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //     Positioned(
        //       top: 0,
        //       right: 0,
        //       child:  Text(
        //         "1000Ks",
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: TEXT_REGULAR_2X,
        //             fontWeight: FontWeight.w500),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
