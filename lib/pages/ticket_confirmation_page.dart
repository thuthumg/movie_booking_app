import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/clip_date_card.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';
import 'package:movie_booking_app/widgets/my_clipper_card.dart';
import 'package:movie_booking_app/widgets/my_separator_view.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketConfirmationPage extends StatefulWidget {
  const TicketConfirmationPage({Key? key}) : super(key: key);

  @override
  State<TicketConfirmationPage> createState() => _TicketConfirmationPageState();
}

class _TicketConfirmationPageState extends State<TicketConfirmationPage> {
  final String data = 'https://www.example.com';
  bool _taskLoadingCompleted = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _runDelayedTask();
  }

  Future<void> _runDelayedTask() async {
    print('Starting the delayed task');
    await Future.delayed(Duration(seconds: 3));
    print('Delayed task completed');
    setState(() {
      _taskLoadingCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PRIMARY_COLOR,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(
                  height: 46,
                ),
                const Text(
                  "Ticket Confirmation",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_REGULAR_2X,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        child: TicketCardBackgroundView(),
                      ),
                      Positioned(
                        top: 150,
                        left: 0,
                        right: 0,
                        child: ClipSectionView(),
                      ),
                      Positioned(
                        //  top: MARGIN_CARD_MEDIUM_2,
                        left: MARGIN_CARD_MEDIUM_2,
                        right: 0,
                        child: TicketConfirmationInfoView(),
                      ),
                      Positioned(
                        top: 200,
                        left: 40,
                        right: 40,
                        child: BookingDateTimeAndLocationView(),
                      ),
                    ],
                  ),
                ),
                QRSectionView(data: data),
                DoneButtonView(),
              ],
            ),
          ),
          Positioned.fill(
              child: Visibility(
            visible: _taskLoadingCompleted,
            child: Image.asset(
              "assets/images/screen_overlay.png",
              fit: BoxFit.cover,
            ),
          )),
        ],
      ),
    );
  }
}

class DoneButtonView extends StatelessWidget {
  const DoneButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: EdgeInsets.all(MARGIN_XLARGE),
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_MEDIUM_3),
        child: CustomButtonView(
            buttonContainerBgColor: SECONDARY_COLOR,
            buttonContainerHeight: LOGIN_PAGE_BUTTON_HEIGHT,
            buttonContainerRadius: 4,
            iconPadding: 0,
            iconWidthHeight: 0,
            textColor: Colors.black,
            textDesc: "DONE",
            textFontSize: TEXT_REGULAR_2X,
            iconPath: '',
            isShowIcon: false,
            () {}),
      ),
    );
  }
}

class QRSectionView extends StatelessWidget {
  const QRSectionView({
    Key? key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrImage(
          data: data,
          version: QrVersions.auto,
          size: 100.0,
          foregroundColor: Colors.white,
          // backgroundColor: Colors.white,
        ),
        const Text(
          "WAG5LP1C",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: TEXT_REGULAR_1X),
        ),
        RichText(
          text: const TextSpan(
            text: "TPIN:",
            style: TextStyle(
                color: Color.fromRGBO(136, 136, 136, 1),
                fontSize: TEXT_REGULAR_1X,
                fontWeight: FontWeight.w400),
            children: <TextSpan>[
              TextSpan(
                text: "WKCSL96",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TicketConfirmationInfoView extends StatelessWidget {
  const TicketConfirmationInfoView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          Container(
            height: 150,
            child: Row(
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
                      padding: const EdgeInsets.only(bottom: 14),
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
                      padding: const EdgeInsets.only(bottom: 14),
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
    );
  }
}

class ClipSectionView extends StatelessWidget {
  const ClipSectionView({
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

class TicketCardBackgroundView extends StatelessWidget {
  const TicketCardBackgroundView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 304,
      width: 370,
      child: Image.asset("assets/images/ticket_confirmation_card_bg.png"),
    );
  }
}

class BookingDateTimeAndLocationView extends StatelessWidget {
  const BookingDateTimeAndLocationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                          textAlign :TextAlign.center,
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
    );

  }
}
