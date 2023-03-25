import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class TotalAmountButtonView extends StatefulWidget {
  List<SnackVO> snacksList;
  int snackTotalAmt;
  Function onTapFoodAndBeverageView;
  Function onTapGoToCheckOut;
  bool isBottomSheetView;

  TotalAmountButtonView({
    required this.snacksList,
    required this.snackTotalAmt,
    required this.onTapFoodAndBeverageView,
    required this.onTapGoToCheckOut,
    required this.isBottomSheetView
});

  @override
  State<TotalAmountButtonView> createState() => _TotalAmountButtonViewState();
}

class _TotalAmountButtonViewState extends State<TotalAmountButtonView> {
  @override
  Widget build(BuildContext context) {


    var selectedSnackCount = 0;
    var selectedTotalPrice = 0;
    widget.snacksList.forEach((snackVO) {
        if((snackVO.qty??0) >= 1)
          {
            selectedSnackCount +=1;
            print("${snackVO.qty}------${snackVO.price}");
           // print("snackAmt ${(snackVO.price??0)*( snackVO.qty??0).toInt()}");
            selectedTotalPrice += ((snackVO.qty??0).toInt() * (snackVO.price??0).toInt()).toInt();
           // print("selectedTotalPrice ${selectedTotalPrice}");
          }


    });


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
                      widget.onTapGoToCheckOut();
                  //_navigateToCheckOutPage(context);
                },
                child: TotalAmountTextView(snackTotalAmt: selectedTotalPrice)),
          ),
          Positioned(
            top: 5,
            left: 0,
            child: GestureDetector(
                onTap: () => widget.onTapFoodAndBeverageView(),
                child: FoodAndBeverageAllCountView(isBottomSheetView: this.widget.isBottomSheetView,
                    snackCount: selectedSnackCount)),
          )
        ],
      ),
    );
  }
}

class TotalAmountTextView extends StatelessWidget {
  int snackTotalAmt;
   TotalAmountTextView({
    Key? key,
     required this.snackTotalAmt
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${snackTotalAmt} Ks",
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

  bool isBottomSheetView;
  int snackCount;

  FoodAndBeverageAllCountView({
    required this.isBottomSheetView,
    required this.snackCount
});

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
                      padding: EdgeInsets.all(2),
                      child: Text(
                        textAlign: TextAlign.center,
                        "${snackCount}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ))
            ],
          ),
        ),
        isBottomSheetView ?
        Icon(Icons.keyboard_arrow_up) :  Icon(Icons.keyboard_arrow_down)
      ],
    );
  }
}