import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class TotalAmountButtonView extends StatelessWidget {
  Function onTapFoodAndBeverageView;
  Function onTapGoToCheckOut;
  bool _isBottomSheetView;

  TotalAmountButtonView(this.onTapFoodAndBeverageView,this.onTapGoToCheckOut,
      this._isBottomSheetView);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      // width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(
          color: SECONDARY_COLOR,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            right: 10,
            child: GestureDetector(
                onTap:
                    (){
                      onTapGoToCheckOut();
                  //_navigateToCheckOutPage(context);
                },
                child: TotalAmountTextView()),
          ),
          Positioned(
            top: 5,
            left: 0,
            child: GestureDetector(
                onTap: () => onTapFoodAndBeverageView(),
                child: FoodAndBeverageAllCountView(this._isBottomSheetView)),
          )
        ],
      ),
    );
  }
}

class TotalAmountTextView extends StatelessWidget {
  const TotalAmountTextView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Text(
          "2000Ks",
          style: TextStyle(
            color: Colors.black,
            fontSize: TEXT_REGULAR_2X,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.chevron_right)
      ],
    );
  }
}

class FoodAndBeverageAllCountView extends StatelessWidget {

  bool _isBottomSheetView;

  FoodAndBeverageAllCountView(this._isBottomSheetView);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(
              top: MARGIN_SMALL,
              bottom: MARGIN_SMALL,
              left: MARGIN_MEDIUM_3,
              right: MARGIN_SMALL),
          width: 35,
          height: 35,
          child: Stack(
            children: [
              Positioned.fill(
                  child: Image.asset("assets/images/snack_btn_icon.png")),
              Positioned(
                  top: 5,
                  right: 0,
                  child: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(9)
                      //more than 50% of width makes circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        textAlign: TextAlign.center,
                        "2",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        _isBottomSheetView ?
        Icon(Icons.keyboard_arrow_up) :  Icon(Icons.keyboard_arrow_down)
      ],
    );
  }
}