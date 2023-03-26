import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class SnackListItemView extends StatefulWidget {

  Function(int) onTapAddButton;
  Function(int) onTapPlusButton;
  Function(int) onTapMinusButton;

  SnackVO snackVO;
  SnackListItemView({
    Key? key,
    required this.snackVO,
    required this.onTapAddButton,
    required this.onTapPlusButton,
    required this.onTapMinusButton
  }) : super(key: key);

  @override
  State<SnackListItemView> createState() => _SnackListItemViewState();
}

class _SnackListItemViewState extends State<SnackListItemView> {
  bool _isShowPlusMinusSection = false;

  @override
  Widget build(BuildContext context) {
    int snackQty = widget.snackVO.quantity??0;
    return Container(
      // height: 300,

      margin: const EdgeInsets.only(
          left: MARGIN_MEDIUM_2,
          right: MARGIN_MEDIUM,
          top: MARGIN_MEDIUM_2,
          bottom: MARGIN_MEDIUM),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(102, 102, 102, 0.8),
            Color.fromRGBO(51, 51, 51, 0.4)
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SnackImageView(imageLink: widget.snackVO.image??""),
            const SizedBox(
              height: 10,
            ),
            SnackTitleTextView(titleText: widget.snackVO.name??""),
            const SizedBox(
              height: 10,
            ),
            SnackPriceTextView(priceText: widget.snackVO.price??0),
            const SizedBox(
              height: 10,
            ),
           // _isShowPlusMinusSection
            snackQty >= 1
                ? QtyPlusMinusControlView(snackVO: widget.snackVO,
                onTapPlusButton: (snackId)=>widget.onTapPlusButton(snackId),
                onTapMinusButton: (snackId)=>widget.onTapMinusButton(snackId),
                // onTapButton:
                // (showPlusMinusSection){
                //   setState(() {
                //    // _isShowPlusMinusSection = showPlusMinusSection;
                //   });
                //
                // }

            )
                : GestureDetector(
                    onTap: () {
                      widget.onTapAddButton(widget.snackVO.id??0);
                      // setState(() {
                      //   _isShowPlusMinusSection = !this._isShowPlusMinusSection;
                      // });
                    },
                    child: AddButtonView())
          ],
        ),
      ),
    );
  }
}

class AddButtonView extends StatelessWidget {
  const AddButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
          color: SECONDARY_COLOR,
          borderRadius: BorderRadius.all(Radius.circular(4))),
      child: const Padding(
        padding: EdgeInsets.only(
            right: MARGIN_MEDIUM,
            left: MARGIN_MEDIUM,
            top: MARGIN_MEDIUM,
            bottom: MARGIN_MEDIUM),
        child: Text(
          textAlign: TextAlign.center,
          "ADD",
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class QtyPlusMinusControlView extends StatefulWidget {
  final SnackVO snackVO;
 // Function(bool) onTapButton;

  Function(int) onTapPlusButton;
  Function(int) onTapMinusButton;

  QtyPlusMinusControlView({
    required this.snackVO,
   // required this.onTapButton,
    required this.onTapPlusButton,required this.onTapMinusButton});

  @override
  State<QtyPlusMinusControlView> createState() =>
      _QtyPlusMinusControlViewState();
}

class _QtyPlusMinusControlViewState extends State<QtyPlusMinusControlView> {
  int quantity = 1;

  void updateQuantity(bool isIncrement) {
    setState(() {
      // if (isIncrement) {
      //   quantity++;
      // } else {
      //   if(quantity <= 0)
      //     {
      //       quantity;
      //     }else{
      //     quantity--;
      //   }
      //
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Spacer(),
        GestureDetector(
            onTap: () {
             // updateQuantity(true);
              widget.onTapPlusButton(widget.snackVO.id??0);
            },
            child: PlusButtonView()),
        QtyView(widget.snackVO.quantity??0),
        GestureDetector(
            onTap: () {
             // updateQuantity(false);
             // if(quantity == 0)
            //  widget.onTapButton(false);
              widget.onTapMinusButton(widget.snackVO.id??0);
            },
            child: MinusButtonView()),
      ],
    );
  }
}

class MinusButtonView extends StatelessWidget {
  const MinusButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //     top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
      width: 50,
      height: 50,
      child: Image.asset("assets/icons/ic_minus.png"),
    );
  }
}

class PlusButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(
      //     top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
      width: 50,
      height: 50,
      child: Image.asset("assets/icons/ic_plus.png"),
    );
  }
}

class QtyView extends StatelessWidget {
  final int qtyCount;

  QtyView(this.qtyCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: MARGIN_MEDIUM, bottom: MARGIN_MEDIUM),
      // width: 50,
      height: 50,
      child: Text(
        this.qtyCount.toString(),
        style: const TextStyle(
            fontSize: TEXT_REGULAR_2X,
            color: SECONDARY_COLOR,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}

int calculateQuantity(
    bool isPlusKeyPressed, bool isMinusKeyPressed, int quantity) {
  if (isMinusKeyPressed) {
    return quantity - 1;
  } else if (isPlusKeyPressed) {
    return quantity + 1;
  } else {
    return quantity;
  }
}

class SnackImageView extends StatelessWidget {
  String imageLink;
  SnackImageView({
    Key? key,
    required this.imageLink
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
        child: Image.network(
          width: 100,
          height: 100,
         imageLink,
        ),
      ),
    );
  }
}

class SnackPriceTextView extends StatelessWidget {
  int priceText;
  SnackPriceTextView({
    Key? key,
    required this.priceText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${priceText} KS",
      style: const TextStyle(
        color: SECONDARY_COLOR,
        fontSize: TEXT_REGULAR_1X,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class SnackTitleTextView extends StatelessWidget {
  String titleText;
  SnackTitleTextView({
    Key? key,
    required this.titleText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
     titleText,
      style: const TextStyle(
        color: Colors.white,
        fontSize: TEXT_REGULAR_1X,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
