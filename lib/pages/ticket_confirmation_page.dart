import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/check_out_vo.dart';
import 'package:movie_booking_app/data/vos/city_vo.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/network/api_constants.dart';
import 'package:movie_booking_app/network/requests/check_out_request.dart';
import 'package:movie_booking_app/network/requests/check_out_request_snack_vo.dart';
import 'package:movie_booking_app/pages/main_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/ticket_list_info_item.dart';
import 'package:movie_booking_app/widgets/clip_date_card.dart';
import 'package:movie_booking_app/widgets/custom_button_view.dart';
import 'package:movie_booking_app/widgets/my_clipper_card.dart';
import 'package:movie_booking_app/widgets/my_separator_view.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TicketConfirmationPage extends StatefulWidget {


  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  List<SnackVO>? selectedSnackVOList;
  int theaterShowTimeslotId;
  int paymentId;
  CheckOutVO? checkOutVO;


  TicketConfirmationPage({Key? key,
    required this.cinemaName,
    required this.timeslotTime,
    required this.dateString,
    required this.movieDetailsObj,
    required this.selectedSeatedVOList,
    required this.selectedSnackVOList,
    required this.theaterShowTimeslotId,
    required this.paymentId,
    required this.checkOutVO
  }) : super(key: key);

  @override
  State<TicketConfirmationPage> createState() => _TicketConfirmationPageState();
}

class _TicketConfirmationPageState extends State<TicketConfirmationPage> {
  // MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();
  //
  // ///State Variables
  // CheckOutVO? checkOutVO;
  // UserDataVO? userDataVO;

 // final String data = 'https://www.example.com';
  bool _taskLoadingCompleted = true;
 // CityVO cityVO = CityVO();

  @override
  void initState() {
    ///userdata from Database
    // movieBookingAppModel.getUserDataFromDatabase().then((paramUserDataVO) {
    //   setState(() {
    //     userDataVO = paramUserDataVO;
    //     print("user token from snack page= ${userDataVO?.userToken}");
    //
    //     List<CheckOutRequestSnackVO> checkoutRequestSnackVO=[];
    //     widget.selectedSnackVOList?.map((snackVO){
    //       checkoutRequestSnackVO.add(CheckOutRequestSnackVO(snackVO.id,
    //           snackVO.quantity));
    //     }).toString();
    //
    //     movieBookingAppModel
    //         .checkOut("Bearer ${userDataVO?.userToken ?? ""}",
    //     CheckOutRequest(
    //         cinemaDayTimeslotId: widget.theaterShowTimeslotId,
    //         seatNumber: getSeatVOAsCommaSeparatedString(widget.selectedSeatedVOList??[]),
    //         bookingDate: widget.dateString,
    //         movieId: widget.movieDetailsObj?.id,
    //         paymentTypeId: widget.paymentId,
    //         snacks: checkoutRequestSnackVO)
    //     )
    //         .then((paramCheckoutVO) {
    //
    //       checkOutVO = paramCheckoutVO;
    //
    //       setState(() {
    //        //
    //       });
    //     }).catchError((error) {
    //       debugPrint(error.toString());
    //     });
    //
    //   });
    // }).catchError((error) {
    //   debugPrint(error.toString());
    // });
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
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: PRIMARY_COLOR,
          title: const Text(
            "Ticket Confirmation",
            style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w700),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                     TicketListInfoItem(
                         checkOutVO: widget.checkOutVO,
                         cinemaName: widget.cinemaName,
                         timeslotTime:  widget.timeslotTime,
                         dateString:  widget.dateString,
                         movieDetailsObj:  widget.movieDetailsObj,
                         selectedSeatedVOList:  widget.selectedSeatedVOList,
                         selectedSnackVOList:  widget.selectedSnackVOList,
                         theaterShowTimeslotId:  widget.theaterShowTimeslotId,
                         paymentId:  widget.paymentId,
                         onTapTicketItem: (){})
                      ,
                      const SizedBox(
                        height: 20,
                      ),
                      QRSectionView(qrStr: "${IMAGE_BASE_URL}${widget.checkOutVO?.qrCode}"),
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
                  ),
                ),
              ],
            ),
          ),
        )

        /* Stack(
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
      ),*/
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
            () {

              Navigator.of(context).popUntil((route) => route.isFirst);
            /*
             For city VO condition(15.03.2023)
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>MainPage(cityVO: ,)),
              );*/



            //  Navigator.of(context).pushNamedAndRemoveUntil('/location_page', (Route route) => false);
             // Navigator.of(context).popUntil((route) => route.isFirst);

             // Navigator.popUntil(context, ModalRoute.withName('/movie_page'));
            }),
      ),
    );
  }
}

class QRSectionView extends StatelessWidget {

  String qrStr;

  QRSectionView({
    Key? key,
    required this.qrStr,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QrImage(
          data: qrStr,
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
