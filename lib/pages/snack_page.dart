import 'package:flutter/material.dart';
import 'package:movie_booking_app/pages/check_out_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/viewitems/snack_list_item_view.dart';
import 'package:movie_booking_app/widgets/botton_sheet_view.dart';
import 'package:movie_booking_app/widgets/total_amount_button_view.dart';

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
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.chevron_left)),
          actions: [
            Image.asset(
              "assets/icons/ic_search.png",
            ),
            const Padding(
              padding: EdgeInsets.only(right: MARGIN_MEDIUM_3),
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
              const Expanded(
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
          const SnackListGridView(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_3,
                  right: MARGIN_MEDIUM_3,
                  top: MARGIN_MEDIUM_2,
                  bottom: MARGIN_MEDIUM_2),
              decoration: const BoxDecoration(
                color: PRIMARY_COLOR,
              ),
              child: TotalAmountButtonView(() {
                showModalBottomSheet<dynamic>(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext bc) {
                      return Wrap(children: <Widget>[
                        Container(
                          decoration: const BoxDecoration(
                              // color: forDialog ? Color(0xFF737373) : Colors.white,
                              color: PRIMARY_COLOR,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0))),
                          child: _navigateToBottomSheet(context),
                        )
                      ]);
                    });
              }, () {
                _navigateToCheckOutPage(context);
              }, false),
            ),
          )
        ],
      ),
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
              mainAxisExtent: 290
              // aspect ratio of each item
              ),
          // umber of items in the grid
          itemBuilder: (BuildContext context, int index) {
            return SnackListItemView();
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
