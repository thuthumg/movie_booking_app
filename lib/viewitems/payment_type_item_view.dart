import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class PaymentTypeItemView extends StatelessWidget {

  final String titleLabel;
  final String iconLinkLabel;
  Function onTapTicketItem;

  PaymentTypeItemView(this.titleLabel,this.iconLinkLabel,this.onTapTicketItem);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> onTapTicketItem(),
      child: Container(
        height: 50,
        margin: EdgeInsets.only(top: MARGIN_MEDIUM,bottom: MARGIN_SMALL),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.25),width: 1),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: MARGIN_CARD_MEDIUM_2,right: MARGIN_CARD_MEDIUM_2),
              width: 30,
              height: 30,
              child: Image.network(iconLinkLabel),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(titleLabel,style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: TEXT_REGULAR_1X
              ),),
            ),
            Spacer(),
            Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: MARGIN_CARD_MEDIUM_2),

              child: Image.asset("assets/icons/ic_next.png"),
            )
          ],
        ),
      ),
    );
  }
}
