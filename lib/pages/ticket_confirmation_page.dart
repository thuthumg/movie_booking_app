import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/my_separator_view.dart';

class TicketConfirmationPage extends StatelessWidget {
  const TicketConfirmationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: PRIMARY_COLOR,
        title: const Text(
          "Ticket Confirmation",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 304,
                    width: 370,
                    child: Image.asset(
                        "assets/images/ticket_confirmation_card_bg.png"),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 0,
                  right: 0,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: PRIMARY_COLOR),
                      ),
                      Container(
                        width: 330,
                       child: Image.asset("assets/images/dotted_line.png"),

                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: PRIMARY_COLOR),
                      )
                    ],
                  ),
                ),
                Positioned(
                //  top: MARGIN_CARD_MEDIUM_2,
                  left: MARGIN_CARD_MEDIUM_2,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          child:  Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                child: Image.asset(
                                    "assets/images/ticket_confirm_sample_img.png"),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 14),
                                    child: RichText(
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
                                                fontSize: TEXT_REGULAR,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 14),
                                    child: const Text(
                                      "JCGV:Junction City",
                                      style: TextStyle(
                                          color: SECONDARY_COLOR,
                                          fontSize: TEXT_REGULAR_2X,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 14),
                                    child: RichText(
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
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      text: "Gold-G8,G7",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: TEXT_REGULAR_1X,
                                          fontWeight: FontWeight.w700),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "  (SCREEN 2)",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: TEXT_REGULAR,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),

                        ),
                     //   Image.asset("assets/images/dotted_line.png")
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 40,
                  right: 40,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                              height: 30,
                            child: Image.asset("assets/icons/ic_date.png"),
                          ),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset("assets/icons/ic_time.png"),
                          ),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset("assets/icons/ic_location.png"),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(

                            child: Text("Sat,18 Jun, 2022",
                              overflow: TextOverflow.ellipsis,
                              maxLines:3,
                              softWrap: false,
                              style: TextStyle(
                                color: Colors.white,
                              fontSize: TEXT_REGULAR,
                              fontWeight: FontWeight.w400
                            ),),
                          ),
                          Spacer(),
                          Text("3:30PM",style: TextStyle(
                              color: Colors.white,
                              fontSize: TEXT_REGULAR,
                              fontWeight: FontWeight.w400
                          ),),
                          Spacer(),
                          Expanded(
                            child: Text(
                              "Q5H3+JPP, Corner of,Bogyoke Lann,Yangon",
                                overflow: TextOverflow.ellipsis,
                              maxLines:3,
                              softWrap: false,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: TEXT_REGULAR,
                                fontWeight: FontWeight.w400
                            ),),
                          )
                        ],
                      )
                      
                    ],
                  ),
                ),
                 ],
            ),
          )
        ],
      ),
    );
  }
}
