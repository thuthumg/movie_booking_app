import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/payment_type_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/pages/ticket_confirmation_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/payment_type_item_view.dart';

class TicketPage extends StatefulWidget {

  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  List<SnackVO>? selectedSnackVOList;
  int theaterShowTimeslotId;

  TicketPage({Key? key,
  required this.cinemaName,
    required this.timeslotTime,
    required this.dateString,
    required this.movieDetailsObj,
    required this.selectedSeatedVOList,
    required this.selectedSnackVOList,
    required this.theaterShowTimeslotId
  }) : super(key: key);

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {

  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();

  ///State Variables
  List<PaymentTypeVO>? paymentTypeVOList;
  UserDataVO? userDataVO;

  @override
  void initState() {
    ///userdata from Database
    movieBookingAppModel.getUserDataFromDatabase().then((paramUserDataVO) {
      setState(() {
        userDataVO = paramUserDataVO;
        print("user token from ticket page= ${userDataVO?.userToken}");

        ///payment type from Network
        movieBookingAppModel
            .getPaymentTypesList("Bearer ${userDataVO?.userToken ?? ""}")
            .then((paymentTypeList) {
          setState(() {
            paymentTypeVOList = paymentTypeList;

          });
        }).catchError((error) {
          debugPrint(error.toString());
        });

      });
    }).catchError((error) {
      debugPrint(error.toString());
    });

    print("check param data = ${widget.cinemaName}// ${widget.dateString} // ${widget.theaterShowTimeslotId} //"
        "${widget.cinemaName} // ${widget.movieDetailsObj?.id}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: APP_BAR_COLOR,
          title: const Text(
            TICKET_APP_BART_TITLE,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.chevron_left)),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
                child: NameEditTextView(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
                child: UnlockOrderView(),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
                child: ChooseYourPaymentTypeTitleView(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
                child: PaymentTypeListView(
                    paymentTypeVOList: paymentTypeVOList,
                    onTapTicketItem: (paymentId)=>{
                      _navigateToTicketConfirmPage(context,
                          widget.cinemaName,
                          widget.timeslotTime,
                          widget.dateString,
                          widget.movieDetailsObj,
                          widget.selectedSeatedVOList,
                          widget.selectedSnackVOList,
                          widget.theaterShowTimeslotId,
                          paymentId)
                    }
                ),
              )
            ],
          ),
        ));
  }
}

class PaymentTypeObject {
  String title = "";
  String iconLink = "";

  PaymentTypeObject(this.title, this.iconLink);
}

class PaymentTypeListView extends StatelessWidget {
  final List<PaymentTypeVO>? paymentTypeVOList;
  final Function(int) onTapTicketItem;

  PaymentTypeListView(
  {
    required this.paymentTypeVOList,
    required this.onTapTicketItem

});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: paymentTypeVOList?.length,
          itemBuilder: (BuildContext context, int index) {
            return PaymentTypeItemView(
                paymentTypeVOList?[index].title??"",
                paymentTypeVOList?[index].icon??"",
                (){
                  this.onTapTicketItem(paymentTypeVOList?[index].id??0);
                });
          }),
    );
  }
}
Future<dynamic> _navigateToTicketConfirmPage(BuildContext context,
    String? cinemaName,
String? timeslotTime,
String? dateString,
MovieVO? movieDetailsObj,
List<SeatVO>? selectedSeatedVOList,
List<SnackVO>? selectedSnackVOList,
int theaterShowTimeslotId,
 int paymentId) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => TicketConfirmationPage(
          cinemaName : cinemaName,
          timeslotTime : timeslotTime,
          dateString : dateString,
          movieDetailsObj:movieDetailsObj,
          selectedSeatedVOList:selectedSeatedVOList,
          selectedSnackVOList:selectedSnackVOList,
          theaterShowTimeslotId:theaterShowTimeslotId,
          paymentId: paymentId
      ),
    ),
  );
}

class ChooseYourPaymentTypeTitleView extends StatelessWidget {
  const ChooseYourPaymentTypeTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: const Text(
        CHOOSE_YOUR_PAYMENT_TYPE_TITLE_LABEL,
        style: TextStyle(
            color: CHOOSE_YOUR_PAYMENT_TYPE_TITLE_COLOR,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}

class UnlockOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          color: SECONDARY_COLOR),
      child: Center(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 25,
                height: 25,
                child: Image.asset("assets/icons/ic_offer_black.png"),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                UNLOCK_ORDER_OR_APPLY_PROMO_CODE_LABEL,
                style: TextStyle(
                    color: APP_BAR_COLOR,
                    fontSize: TEXT_REGULAR_1X,
                    fontWeight: FontWeight.w700),
              )
            ]),
      ),
    );
  }
}

class NameEditTextView extends StatelessWidget {
  const NameEditTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(color: Colors.white),
      padding: const EdgeInsets.all(20.0),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            labelText: YOUR_NAME_LABEL,
            labelStyle: const TextStyle(
              color: SECONDARY_COLOR,
            ),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
              borderSide: const BorderSide(
                  width: 1, color: SECONDARY_COLOR), //<-- SEE HERE
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                borderSide: const BorderSide(width: 1, color: SECONDARY_COLOR)),
            hintText: ENTER_YOUR_NAME_HINT_LABEL,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: TEXT_REGULAR_1X,
              color: Color.fromRGBO(68, 68, 68, 1),
            ),
          ),
        ),
      ),
    );
  }
}
