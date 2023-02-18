import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';
import 'package:movie_booking_app/widgets/custom_clip_button_view.dart';
import 'package:movie_booking_app/widgets/my_separator_view.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(17, 17, 17, 1),
        title: const Text(
          "Checkout",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.chevron_left)),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: PRIMARY_COLOR,
          child: Column(
            children: [
              CheckoutDataView(),
              const SizedBox(
                height: 30,
              ),
              const ContinueButtonView()
            ],
          ),
        ),
      ),
    );
  }
}

class CheckoutDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      margin: EdgeInsets.all(MARGIN_MEDIUM_3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromRGBO(68, 68, 68, 1),
            Color.fromRGBO(34, 34, 34, 1),
            Color.fromRGBO(68, 68, 68, 1)
          ],
        ),
        //more than 50% of width makes circle
      ),
      child: Container(
        // height: MediaQuery.of(context).size.height*0.8,
        margin: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              BookingTimePlaceAndSeatView(),
              SizedBox(
                height: 10,
              ),
              SnackView(),
              SizedBox(
                height: 20,
              ),
              ConvenienceFeeAndTicketCancellationView(),
              SizedBox(
                height: 20,
              ),
              TotalAmountView(),
            ],
          ),
        ),
      ),
    );
  }
}

class TotalAmountView extends StatelessWidget {
  const TotalAmountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Stack(
        children: const [
          Positioned(
            left: 0,
            child: Text(
              "Total",
              style: TextStyle(
                  color: SECONDARY_COLOR,
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            right: 0,
            child: Text(
              "22500Ks",
              style: TextStyle(
                  color: SECONDARY_COLOR,
                  fontSize: TEXT_REGULAR_3X,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

class ConvenienceFeeAndTicketCancellationView extends StatelessWidget {
  const ConvenienceFeeAndTicketCancellationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Row(
                  children: const [
                    Text(
                      "Convenience Fee",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const Positioned(
                right: 0,
                child: Text(
                  "500Ks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
          child: Container(
            height: 35,
            width: MediaQuery.of(context).size.width * 0.58,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 107, 0, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_2,
                  right: MARGIN_MEDIUM_2,
                  top: MARGIN_SMALL,
                  bottom: MARGIN_SMALL),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      child:
                          Image.asset("assets/icons/ic_ticket_cancelation.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Ticket Cancellation policy",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_1X,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return TicketCancellationAlertBoxView();
}

class TicketCancellationAlertBoxView extends StatelessWidget {
  const TicketCancellationAlertBoxView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
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

class SnackView extends StatelessWidget {
  const SnackView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: MARGIN_MEDIUM),
                      width: 25,
                      height: 25,
                      child:
                          Image.asset("assets/icons/ic_food_and_beverage.png"),
                    ),
                    Text(
                      "Food and Beverage",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Text(
                  "20000Ks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: MARGIN_MEDIUM),
                      width: 25,
                      height: 25,
                      child: Image.asset("assets/icons/ic_delete.png"),
                    ),
                    Text(
                      "Potatoe Chips(Qt.1)",
                      style: TextStyle(
                          color: Color.fromRGBO(136, 136, 136, 1),
                          fontSize: TEXT_REGULAR_1X,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Text(
                  "10000Ks",
                  style: TextStyle(
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: TEXT_REGULAR_1X,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 40,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: MARGIN_MEDIUM),
                      width: 25,
                      height: 25,
                      child: Image.asset("assets/icons/ic_delete.png"),
                    ),
                    Text(
                      "Potatoe Chips(Qt.1)",
                      style: TextStyle(
                          color: Color.fromRGBO(136, 136, 136, 1),
                          fontSize: TEXT_REGULAR_1X,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Positioned(
                right: 0,
                child: Text(
                  "10000Ks",
                  style: TextStyle(
                      color: Color.fromRGBO(136, 136, 136, 1),
                      fontSize: TEXT_REGULAR_1X,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        // Divider(color: Colors.white,),
        MySeparatorView(color: Colors.grey),
      ],
    );
  }
}

class BookingTimePlaceAndSeatView extends StatelessWidget {
  const BookingTimePlaceAndSeatView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: "Black Widow",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700),
            children: <TextSpan>[
              TextSpan(
                text: "  (3D)(U/A)",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          text: const TextSpan(
            text: "JCGV:Junction City",
            style: TextStyle(
                color: SECONDARY_COLOR,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w700),
            children: <TextSpan>[
              TextSpan(
                text: "  (SCREEN 2)",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                width: 30,
                height: 30,
                child: Image.asset("assets/icons/ic_date.png"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 30,
                height: 30,
                child: Image.asset("assets/icons/ic_time.png"),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 30,
                height: 30,
                child: Image.asset("assets/icons/ic_location.png"),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                "Sat,18 Jun,2022",
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "3:30PM",
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "Q5H3+JPP,Corner of,Bogyoke Lann,Yangon",
                style: TextStyle(
                    fontSize: TEXT_REGULAR_2X,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          text: const TextSpan(
            text: "M-Ticket(",
            style: TextStyle(
                color: Colors.white70,
                fontSize: TEXT_REGULAR,
                fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                text: "2",
                style: TextStyle(
                    color: SECONDARY_COLOR,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w400),
              ),
              TextSpan(
                text: ")",
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: TEXT_REGULAR,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 40,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                child: Text(
                  "Gold-G8,G7",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                right: 0,
                child: Text(
                  "20000Ks",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}

class ContinueButtonView extends StatelessWidget {
  const ContinueButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.only(bottom: MARGIN_XLARGE),
        child: CustomClipButtonView("Continue"),
      ),
    );
  }
}
