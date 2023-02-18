import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:movie_booking_app/viewitems/payment_type_item_view.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

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
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM, right: MARGIN_MEDIUM),
                child: PaymentTypeListView(),
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
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: paymentTypeList.length,
          itemBuilder: (BuildContext context, int index) {
            return PaymentTypeItemView(
                paymentTypeList[index].title, paymentTypeList[index].iconLink);
          }),
    );
  }
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
                child: Image.asset("assets/icons/ic_offer.png"),
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
