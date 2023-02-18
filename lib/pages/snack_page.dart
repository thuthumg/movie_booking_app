import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/check_out_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/widgets/botton_sheet_view.dart';

class SnackPage extends StatelessWidget {
  List<String> snackTabList = ["All", "Combo", "Snack", "Pop Corn", "Beverage"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(17, 17, 17, 1),
          title: const Text(
            "Grab a bite!",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          leading: Icon(Icons.chevron_left),
          actions: [
            Image.asset(
              "assets/icons/ic_search.png",
            ),
            Padding(
              padding: const EdgeInsets.only(right: MARGIN_MEDIUM_3),
              child: Center(
                child: Text(
                  "SKIP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: SnackTabBar(snackTabList: snackTabList),
              ),
              Expanded(
                flex: 10,
                child: SnackListViewAndTotalAmountView(),
              ),
            ],
          ),
        ));
  }
}

class SnackTabBar extends StatelessWidget {
  const SnackTabBar({
    Key? key,
    required this.snackTabList,
  }) : super(key: key);

  final List<String> snackTabList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(17, 17, 17, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
        child: DefaultTabController(
          length: snackTabList.length,
          child: TabBar(
            isScrollable: true,
            indicatorColor: SECONDARY_COLOR,
            unselectedLabelColor: Colors.white,
            tabs: snackTabList
                .map(
                  (genre) => Tab(
                    child: Text(genre),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class SnackListViewAndTotalAmountView extends StatelessWidget {
  const SnackListViewAndTotalAmountView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SnackListGridView(),
          Align(
            alignment: Alignment.bottomCenter,
            child: TotalAmountButtonView(() {

              showModalBottomSheet<dynamic>(
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                               // color: forDialog ? Color(0xFF737373) : Colors.white,
                                color: PRIMARY_COLOR,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25.0),
                                    topRight: Radius.circular(25.0))),
                            child: _navigateToBottomSheet(context),
                          )
                        ]
                    );
                  }
              );



            }),
          )
        ],
      ),
    );
  }
}

class TotalAmountButtonView extends StatelessWidget {
  Function onTapFoodAndBeverageView;

  TotalAmountButtonView(this.onTapFoodAndBeverageView);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black87,
      height: 90,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
          left: MARGIN_MEDIUM_3,
          right: MARGIN_MEDIUM_3,
          top: MARGIN_MEDIUM_2,
          bottom: MARGIN_MEDIUM_2),
      decoration: const BoxDecoration(
        color: PRIMARY_COLOR,
      ),

      child: Container(
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
                  onTap: (){
                    _navigateToCheckOutPage(context);
                  },
                  child: TotalAmountTextView()),
            ),
            Positioned(
              top: 5,
              left: 0,
              child: GestureDetector(
                  onTap: () => onTapFoodAndBeverageView(),
                  child: FoodAndBeverageAllCountView()),
            )
          ],
        ),
      ),
    );
  }
}

class FoodAndBeverageAllCountView extends StatelessWidget {
  const FoodAndBeverageAllCountView({
    Key? key,
  }) : super(key: key);

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
                        "12",
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
        Icon(Icons.keyboard_arrow_down)
      ],
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

class SnackListGridView extends StatelessWidget {
  const SnackListGridView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.black87,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // number of columns
              mainAxisSpacing: 5,
              // vertical space between items
              crossAxisSpacing: 5,
              // horizontal space between items
              childAspectRatio: 1,
              //
              mainAxisExtent: 260
              // aspect ratio of each item
              ),
          // umber of items in the grid
          itemBuilder: (BuildContext context, int index) {
            return Container(
              // height: 300,
              margin: EdgeInsets.only(
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
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(MARGIN_CARD_MEDIUM_2),
                        child: Image.asset(
                          width: 100,
                          height: 100,
                          "assets/images/snack_sample_photo.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Potato Chips",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: TEXT_REGULAR_1X,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Text(
                      "1000KS",
                      style: TextStyle(
                        color: SECONDARY_COLOR,
                        fontSize: TEXT_REGULAR_1X,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
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
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: 20,
          // n
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}

BottomSheetView _navigateToBottomSheet(BuildContext context) {
  return BottomSheetView();
}
Future<dynamic> _navigateToCheckOutPage(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CheckOutPage(),
    ),
  );
}
