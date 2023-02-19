
import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';

class TicketCancellationAlertBoxView extends StatelessWidget {
  const TicketCancellationAlertBoxView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: SECONDARY_COLOR),
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      backgroundColor: PRIMARY_COLOR,
      title: const Text(
        'Ticket Cancellation Policy',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: TEXT_REGULAR_1X,
        ),
      ),
      content: Container(
        //  color: PRIMARY_COLOR,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: MARGIN_MEDIUM),
                  width: 25,
                  height: 25,
                  child: Image.asset("assets/icons/ic_food_and_beverage.png"),
                ),
                const Text(
                  "100%Refund on F&B",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: MARGIN_MEDIUM),
                  width: 25,
                  height: 25,
                  child: Image.asset("assets/icons/ic_ticket.png"),
                ),
                const Text(
                  "Up to 75% Refund for Tickets",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              margin: const EdgeInsets.only(left: MARGIN_XLARGE),
              child: const Text(
                "-75% refund until 2 hous before show start time",
                style: TextStyle(
                    color: Color.fromRGBO(136, 136, 136, 1),
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              margin: EdgeInsets.only(left: MARGIN_XLARGE),
              child: const Text(
                "-50% refund between 2 hours and 20 minutes before show start time",
                style: TextStyle(
                    color: Color.fromRGBO(136, 136, 136, 1),
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "1. Refund not available for Convenience fees,Vouchers,Gift Cards, Taxes etc.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 14,
            ),
            const Text(
              "2. No cancelation within 20 minute of show start time.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CustomButtonView(
              buttonContainerBgColor: SECONDARY_COLOR,
              buttonContainerHeight: LOGIN_PAGE_BUTTON_HEIGHT,
              buttonContainerRadius: BORDER_RADIUS,
              iconPadding: 0,
              iconWidthHeight: 0,
              textColor: Colors.black,
              textDesc: "Close",
              textFontSize: TEXT_REGULAR_2X,
              iconPath: '',
              isShowIcon: false, () {
            Navigator.of(context).pop();
          }),
        )
      ],
    );
  }
}