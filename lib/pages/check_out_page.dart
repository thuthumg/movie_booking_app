import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/ticket_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';
import 'package:movie_booking_app/widgets/custom_clip_button_view.dart';
import 'package:movie_booking_app/widgets/my_separator_view.dart';
import 'package:movie_booking_app/widgets/ticket_cancellation_alert_box_view.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        centerTitle: true,
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
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: PRIMARY_COLOR,
              child: Stack(
                children: const [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: CheckOutBackgroundView(),
                  ),
                  Positioned(
                    top: 400,
                    left: 0,
                    right: 0,
                    child: CheckOutClipSectionView(),
                  ),


                ],
              ),
            ),
            ContinueButtonView(),
          ],
        ),
      ),
    );
  }
}

class CheckOutClipSectionView extends StatelessWidget {
  const CheckOutClipSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: PRIMARY_COLOR),
        ),
        Container(
          width: 330,
          child: Image.asset("assets/images/dotted_line.png"),
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: PRIMARY_COLOR),
        )
      ],
    );
  }
}

class CheckOutBackgroundView extends StatelessWidget {
  const CheckOutBackgroundView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 618,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        image: DecorationImage(
         fit: BoxFit.fill,
          image: AssetImage("assets/images/checkout_bg.png")
        )
      ),
     // width: 618,
      child: CheckoutDataView(),
    );
  }
}

class CheckoutDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height*0.8,
      height: 317,
      margin: EdgeInsets.all(MARGIN_MEDIUM_3),
    //  margin: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
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
                  fontSize: TEXT_REGULAR_4X,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            right: 0,
            child: Text(
              "22500Ks",
              style: TextStyle(
                  color: SECONDARY_COLOR,
                  fontSize: TEXT_REGULAR_4X,
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

class SnackView extends StatefulWidget {

  @override
  State<SnackView> createState() => _SnackViewState();
}

class _SnackViewState extends State<SnackView> {
  bool isLisShowDetails = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: (){
              setState(() {
                isLisShowDetails = !this.isLisShowDetails;
              });
            },
            child: FoodAndBeverageTitleViewAndTotalAmtView(isLisShowDetails)),
        Visibility(
            visible: isLisShowDetails,
            child: Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return FoodAndBeverageListItemView();
                },
              ),
            ))
        ,
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class FoodAndBeverageListItemView extends StatelessWidget {
  const FoodAndBeverageListItemView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child:
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM),
            width: 25,
            height: 25,
            child: Image.asset("assets/icons/ic_delete.png"),
          ),SizedBox(width: 10,),
          const Text(
            "Potatoes Chips(Qt.1)",
            style: TextStyle(
                color: Color.fromRGBO(136, 136, 136, 1),
                fontSize: TEXT_REGULAR_1X,
                fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Text(
            "10000Ks",
            style: TextStyle(
                color: Color.fromRGBO(136, 136, 136, 1),
                fontSize: TEXT_REGULAR_1X,
                fontWeight: FontWeight.w400),
          )
        ],
      )

      // Stack(
      //   children: [
      //     Positioned(
      //       left: 0,
      //       child: Row(
      //         children: [
      //           Container(
      //             padding: EdgeInsets.only(right: MARGIN_MEDIUM),
      //             width: 25,
      //             height: 25,
      //             child: Image.asset("assets/icons/ic_delete.png"),
      //           ),
      //           const Text(
      //             "Potatoes Chips(Qt.1)",
      //             style: TextStyle(
      //                 color: Color.fromRGBO(136, 136, 136, 1),
      //                 fontSize: TEXT_REGULAR_1X,
      //                 fontWeight: FontWeight.w400),
      //           )
      //         ],
      //       ),
      //     ),
      //     const Positioned(
      //       right: 0,
      //       child: Text(
      //         "10000Ks",
      //         style: TextStyle(
      //             color: Color.fromRGBO(136, 136, 136, 1),
      //             fontSize: TEXT_REGULAR_1X,
      //             fontWeight: FontWeight.w400),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class FoodAndBeverageTitleViewAndTotalAmtView extends StatelessWidget {
  bool isLisShowDetails;

  FoodAndBeverageTitleViewAndTotalAmtView(this.isLisShowDetails);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: MARGIN_MEDIUM),
            width: 25,
            height: 25,
            child:
            Image.asset("assets/icons/ic_food_and_beverage.png"),
          ),
          const Text(
            "Food and Beverage",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          ),
          isLisShowDetails?
          Icon(
            Icons.keyboard_arrow_up,
            color: Colors.white,
          ):Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          )
          ,
          Spacer(),
          Text(
            "20000Ks",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_2X,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
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
        Container(
          // padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.asset("assets/icons/ic_date.png"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sat,18 Jun, 2022",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: TEXT_REGULAR,
                            fontWeight: FontWeight.w400),
                      ),
                      // Spacer(),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.asset("assets/icons/ic_time.png"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "3:30PM",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: TEXT_REGULAR,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Image.asset("assets/icons/ic_location.png"),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.20,
                          child: const Text(
                            "Q5H3+JPP, Corner of,Bogyoke Lann,Yangon",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            softWrap: false,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: TEXT_REGULAR,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

            ],
          ),
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
        child: GestureDetector(
            onTap: (){
              _navigateToTicketPage(context);
            },
            child: CustomClipButtonView("Continue")),
      ),
    );
  }
}

Future<dynamic> _navigateToTicketPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TicketPage(),
    ),
  );
}
