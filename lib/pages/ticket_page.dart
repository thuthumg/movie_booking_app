import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/viewitems/payment_type_item_view.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: PRIMARY_COLOR,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(17, 17, 17, 1),
          title: const Text(
            "Payment",
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
              child: Icon(Icons.chevron_left)),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_3,right: MARGIN_MEDIUM_3),
                child: NameEditTextView(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM_3,right: MARGIN_MEDIUM_3),
                child: UnlockOrderView(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM,right: MARGIN_MEDIUM),
                child: ChooseYourPaymentTypeTitleView(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: MARGIN_MEDIUM,right: MARGIN_MEDIUM),
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
  PaymentTypeObject(
    this.title,
    this.iconLink
  );
}
class PaymentTypeListView extends StatelessWidget {


  var paymentTypeList = <PaymentTypeObject>[

    PaymentTypeObject("UPI","assets/icons/ic_upi.png"),
    PaymentTypeObject("Gift Voucher","assets/icons/ic_gift_voucher.png"),
    PaymentTypeObject("Quck Pay","assets/icons/ic_quick_pay.png"),
    PaymentTypeObject("Credit Card/Debit Card","assets/icons/ic_credit_card.png" ),
    PaymentTypeObject("Redeem Ponit","assets/icons/ic_redeem_point.png"),
    PaymentTypeObject("Mobile Wallet","assets/icons/ic_mobile_wallet.png"),
    PaymentTypeObject("Net Banking","assets/icons/ic_net_banking.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.5,
        margin: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0
        ),
        child:ListView.builder(
            scrollDirection: Axis.vertical,
          //  shrinkWrap: true,
          //  physics: NeverScrollableScrollPhysics(),
           // padding: const EdgeInsets.only(left: MARGIN_MEDIUM_2),
            itemCount: paymentTypeList.length,
            itemBuilder: (BuildContext context, int index) {
              return PaymentTypeItemView(
                  paymentTypeList[index].title,
                paymentTypeList[index].iconLink
              );
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
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0
      ),
      child: Text(
        "Choose your payment type",
        style: TextStyle(
          color: Color.fromRGBO(0, 255, 106, 1),
          fontSize: TEXT_REGULAR_2X,
          fontWeight: FontWeight.w700
        ),
      ),
    );
  }
}

class UnlockOrderView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(
          left: 20.0,
      right: 20.0),
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            color: SECONDARY_COLOR
      ),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children:[
            Container(
              width: 25,
              height: 25,
              child: Image.asset("assets/icons/ic_offer.png"),),
            SizedBox(width: 10,),
            Text("Unlock Offer or Apply Promocode",style: TextStyle(
              color: Color.fromRGBO(17, 17, 17, 1),
              fontSize: TEXT_REGULAR_1X,
              fontWeight: FontWeight.w700

            ),)
          ]


        ),
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
      padding: new EdgeInsets.all(20.0),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.start,
          decoration: InputDecoration(
            labelText: "Your Name",
            labelStyle: TextStyle(
              color: SECONDARY_COLOR,
            ),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
              borderSide: BorderSide(
                  width: 1, color: SECONDARY_COLOR), //<-- SEE HERE
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
                borderSide: BorderSide(width: 1, color: SECONDARY_COLOR)),
            hintText: "Enter your name",
            hintStyle: TextStyle(
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
