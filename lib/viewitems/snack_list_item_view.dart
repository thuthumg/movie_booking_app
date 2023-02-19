import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class SnackListItemView extends StatefulWidget {
  const SnackListItemView({
    Key? key,
  }) : super(key: key);

  @override
  State<SnackListItemView> createState() => _SnackListItemViewState();
}

class _SnackListItemViewState extends State<SnackListItemView> {
  bool _isShowPlusMinusSection = false;

  @override
  Widget build(BuildContext context) {
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
            SnackImageView(),
            const SizedBox(
              height: 10,
            ),
            SnackTitleTextView(),
            const SizedBox(
              height: 10,
            ),
            SnackPriceTextView(),
            const SizedBox(
              height: 10,
            ),
            _isShowPlusMinusSection
                ? QtyPlusMinusControlView()
                : GestureDetector(
                    onTap: () {
                      setState(() {
                        _isShowPlusMinusSection = !this._isShowPlusMinusSection;
                      });
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
  @override
  State<QtyPlusMinusControlView> createState() =>
      _QtyPlusMinusControlViewState();
}

class _QtyPlusMinusControlViewState extends State<QtyPlusMinusControlView> {
  int quantity = 0;

  void updateQuantity(bool isIncrement) {
    setState(() {
      if (isIncrement) {
        quantity++;
      } else {
        if(quantity <= 0)
          {
            quantity;
          }else{
          quantity--;
        }

      }
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
              updateQuantity(true);
            },
            child: PlusButtonView()),
        QtyView(quantity),
        GestureDetector(
            onTap: () {
              updateQuantity(false);
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
        style: TextStyle(
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
  const SnackImageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
        child: Image.asset(
          width: 100,
          height: 100,
          "assets/images/snack_sample_photo.png",
        ),
      ),
    );
  }
}

class SnackPriceTextView extends StatelessWidget {
  const SnackPriceTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "1000KS",
      style: TextStyle(
        color: SECONDARY_COLOR,
        fontSize: TEXT_REGULAR_1X,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class SnackTitleTextView extends StatelessWidget {
  const SnackTitleTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Potato Chips",
      style: TextStyle(
        color: Colors.white,
        fontSize: TEXT_REGULAR_1X,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
