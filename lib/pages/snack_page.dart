import 'package:flutter/material.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model.dart';
import 'package:movie_booking_app/data/models/movie_booking_app_model_impl.dart';
import 'package:movie_booking_app/data/vos/movie_vo.dart';
import 'package:movie_booking_app/data/vos/seat_vo.dart';
import 'package:movie_booking_app/data/vos/snack_category_vo.dart';
import 'package:movie_booking_app/data/vos/snack_vo.dart';
import 'package:movie_booking_app/data/vos/timeslots_vo.dart';
import 'package:movie_booking_app/data/vos/user_data_vo.dart';
import 'package:movie_booking_app/pages/check_out_page.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/viewitems/snack_list_item_view.dart';
import 'package:movie_booking_app/widgets/botton_sheet_view.dart';
import 'package:movie_booking_app/widgets/total_amount_button_view.dart';

class SnackPage extends StatefulWidget {
  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  int theaterShowTimeslotId;

  SnackPage(
      {required this.cinemaName,
      required this.timeslotTime,
      required this.dateString,
      required this.movieDetailsObj,
      required this.selectedSeatedVOList,
      required this.theaterShowTimeslotId});

  @override
  State<SnackPage> createState() => _SnackPageState();
}

class _SnackPageState extends State<SnackPage> {
  MovieBookingAppModel movieBookingAppModel = MovieBookingAppModelImpl();

  // List<String> snackTabList = ["All", "Combo", "Snack", "Pop Corn", "Beverage"];

  ///State Variables
  List<SnackCategoryVO>? snackTabList;
  UserDataVO? userDataVO;
  List<SnackVO>? snacksByCategoryId;
  List<SnackVO>? selectedSnacksList = [];

  int snackTotalAmt = 0;

  @override
  void initState() {
    snackTotalAmt = 0;
    selectedSnacksList = [];
    ///userdata from Database
    movieBookingAppModel.getUserDataFromDatabase().then((paramUserDataVO) {
      setState(() {
        userDataVO = paramUserDataVO;
        print("user token from snack page= ${userDataVO?.userToken}");

        ///snack category from Network
        movieBookingAppModel
            .getSnackCategoriesList("Bearer ${userDataVO?.userToken ?? ""}")
            .then((snackCategoryList) {
          setState(() {
            snackTabList = snackCategoryList;
            print("snack list= ${snackTabList}");
          });
        }).catchError((error) {
          debugPrint(error.toString());
        });

        getSnackListByCategoryId(0);
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(17, 17, 17, 1),
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
                child: SnackTabBar(
                  snackTabList: snackTabList ?? [],
                  onChooseSnackCategory: (categoryId) {
                    if (categoryId != null) {
                      getSnackListByCategoryId(categoryId);
                    }
                  },
                ),
              ),
              Expanded(
                flex: 10,
                child: SnackListViewAndTotalAmountView(
                  snacksList: this.snacksByCategoryId ?? [],
                  snackTotalAmt: snackTotalAmt,
                  onTapAddButton: (snackId) {
                    setState(() {
                     // print("page level set state");

                     
                      var snacksListByCategoryId =
                          this.snacksByCategoryId ?? [];
                      for (int i = 0; i < snacksListByCategoryId.length; i++) {
                        // print(
                        //     "page level set state for loop ------${snacksListByCategoryId[i].id} ${snackId}");
                        if (snacksListByCategoryId[i].id == snackId) {
                          // print("page level set state for loop ------");
                          int? nullableInteger = snacksListByCategoryId[i].quantity;
                          // print(
                          //     "page level set state for loop qty null case ------ ${nullableInteger}");
                          if (nullableInteger != null) {
                            // add one to the integer value using the null-aware operator
                            nullableInteger += 1;
                            snacksListByCategoryId[i].quantity = nullableInteger;
                          } else {
                            snacksListByCategoryId[i].quantity = 1;
                          }
                          selectedSnacksList?.add(snacksListByCategoryId[i]);
                          break;
                        }
                      }
                      // print(
                      //     "page level set state ${snacksListByCategoryId[0].quantity}");
                      // for (var snackVO in snacksListByCategoryId) {
                      //   if ((snackVO.quantity ?? 0).toInt() >= 1)
                      //     snackTotalAmt += snackVO.calculateSnackItemAmt();
                      // }
                      //
                     snackTotalAmt = snacksListByCategoryId
                      ?.where((snackObj) => (snackObj.quantity ?? 0).toInt() >= 1 ).toList()
                      .map((snackObj) => snackObj.calculateSnackItemAmt())
                      .reduce((a, b)  => (a.toInt())+ (b.toInt()))??0;

                      this.snacksByCategoryId = snacksListByCategoryId;
                    });
                  },
                  onTapPlusButton: (snackId) {
                    setState(() {
                      print("page level set state");
                      var snacksListByCategoryId =
                          this.snacksByCategoryId ?? [];
                      for (int i = 0; i < snacksListByCategoryId.length; i++) {
                        print(
                            "page level set state for loop ------${snacksListByCategoryId[i].id} ${snackId}");
                        if (snacksListByCategoryId[i].id == snackId) {
                          print("page level set state for loop ------");
                          int? nullableInteger = snacksListByCategoryId[i].quantity;
                          print(
                              "page level set state for loop qty null case ------ ${nullableInteger}");
                          if (nullableInteger != null) {
                            // add one to the integer value using the null-aware operator
                            nullableInteger += 1;
                            snacksListByCategoryId[i].quantity = nullableInteger;
                            // assign the updated value back to the object using the null-aware assignment operator
                            // nullableInteger ??= 0;
                          } else {
                            snacksListByCategoryId[i].quantity = 1;
                          }

                          break;
                        }
                      }
                      print(
                          "page level set state ${snacksListByCategoryId[0].quantity}");
                      snackTotalAmt = 0;
                      snacksListByCategoryId.forEach((snackVO) {
                        if ((snackVO.quantity ?? 0).toInt() >= 1)
                          snackTotalAmt += snackVO.calculateSnackItemAmt();
                      });

                      this.snacksByCategoryId = snacksListByCategoryId;
                    });
                  },
                  onTapMinusButton: (snackId) {
                    setState(() {
                      print("page level set state");
                      var snacksListByCategoryId =
                          this.snacksByCategoryId ?? [];
                      for (int i = 0; i < snacksListByCategoryId.length; i++) {
                        print(
                            "page level set state for loop ------${snacksListByCategoryId[i].id} ${snackId}");
                        if (snacksListByCategoryId[i].id == snackId) {
                          print("page level set state for loop ------");
                          int? nullableInteger = snacksListByCategoryId[i].quantity;
                          print(
                              "page level set state for loop qty null case ------ ${nullableInteger}");
                          if (nullableInteger != null) {
                            // add one to the integer value using the null-aware operator
                            if (nullableInteger > 0) {
                              nullableInteger -= 1;
                            } else {
                              nullableInteger = 0;
                            }

                            snacksListByCategoryId[i].quantity = nullableInteger;
                            // assign the updated value back to the object using the null-aware assignment operator
                            // nullableInteger ??= 0;
                          } else {
                            snacksListByCategoryId[i].quantity = 0;
                          }

                          break;
                        }
                      }
                      print(
                          "page level set state ${snacksListByCategoryId[0].quantity}");
                      // snackTotalAmt = 0;
                      snacksListByCategoryId.forEach((snackVO) {
                        if ((snackVO.quantity ?? 0).toInt() >= 1) {
                          snackTotalAmt -= snackVO.calculateSnackItemAmt();
                        }
                      });

                      this.snacksByCategoryId = snacksListByCategoryId;
                    });
                  },
                  cinemaName: widget.cinemaName,
                  timeslotTime: widget.timeslotTime,
                  dateString: widget.dateString,
                  movieDetailsObj: widget.movieDetailsObj,
                  selectedSeatedVOList: widget.selectedSeatedVOList,
                  theaterShowTimeslotId: widget.theaterShowTimeslotId,
                ),
              ),
            ],
          ),
        ));
  }

  void getSnackListByCategoryId(int categoryId) {
    movieBookingAppModel
        .getSnacksList("Bearer ${this.userDataVO?.userToken}", categoryId)
        .then((snackList) {
      setState(() {
        this.snacksByCategoryId =  syncSnackArrayListFunction(snackList??[],selectedSnacksList);
       // this.snacksByCategoryId = snackList ?? [];
      });
    }).catchError((error) {
      debugPrint(error.toString());
    });
  }

  List<SnackVO> syncSnackArrayListFunction(List<SnackVO> snackList, List<SnackVO>? selectedSnacksList) {

    if(selectedSnacksList != null && selectedSnacksList.isNotEmpty)
      {
        for (SnackVO snackVO in selectedSnacksList) {
            for(SnackVO networkSnackVO in snackList)
              {
                if(snackVO.id == networkSnackVO.id)
                  {
                    networkSnackVO.quantity = snackVO.quantity;
                  }
               // break;
              }
        }

      }
    var greaterThanOneArrayList = snackList
        .where((snackObj) => (snackObj.quantity ?? 0).toInt() >= 1 ).toList();
    if(greaterThanOneArrayList.isNotEmpty && (greaterThanOneArrayList.length > 1) )
      {
        snackTotalAmt = greaterThanOneArrayList
            .map((snackObj) => snackObj.calculateSnackItemAmt())
            .reduce((a, b)  => (a.toInt())+ (b.toInt()))??0;

      }else{
      if(greaterThanOneArrayList.length == 1) {
        snackTotalAmt = snackList[0].calculateSnackItemAmt();
      } else {
        snackTotalAmt = 0;
      }
    }

    return snackList;

    //
    // if (snackList.contains(selectedSnacksList)) {
    //   print("Second array is included in the first array.");
    //
    //   snackList.replaceRange(0, firstArray.length, secondArray);
    //
    // } else {
    //   print("Second array is not included in the first array.");
    // }
  }
}

class SnackTabBar extends StatelessWidget {
  final List<SnackCategoryVO> snackTabList;
  final Function(int?) onChooseSnackCategory;

  SnackTabBar(
      {Key? key,
      required this.snackTabList,
      required this.onChooseSnackCategory})
      : super(key: key);

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
                  (snackCategory) => Tab(
                    child: Text(snackCategory.title.toString()),
                  ),
                )
                .toList(),
            onTap: (index) {
              onChooseSnackCategory(snackTabList[index].id);
            },
          ),
        ),
      ),
    );
  }
}

class SnackListViewAndTotalAmountView extends StatefulWidget {
  Function(int) onTapAddButton;
  List<SnackVO> snacksList;
  Function(int) onTapPlusButton;
  Function(int) onTapMinusButton;
  int snackTotalAmt;


  ///data param for checkout function
  String? cinemaName;
  String? timeslotTime;
  String? dateString;
  MovieVO? movieDetailsObj;
  List<SeatVO>? selectedSeatedVOList;
  int theaterShowTimeslotId;

  SnackListViewAndTotalAmountView(
      {Key? key,
      required this.snacksList,
      required this.snackTotalAmt,
      required this.onTapAddButton,
      required this.onTapPlusButton,
      required this.onTapMinusButton,
      required this.cinemaName,
      required this.timeslotTime,
      required this.dateString,
      required this.movieDetailsObj,
      required this.selectedSeatedVOList,
      required this.theaterShowTimeslotId})
      : super(key: key);

  @override
  State<SnackListViewAndTotalAmountView> createState() =>
      _SnackListViewAndTotalAmountViewState();
}

class _SnackListViewAndTotalAmountViewState
    extends State<SnackListViewAndTotalAmountView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(34, 34, 34, 1),
            Color.fromRGBO(17, 17, 17, 0.1),
            Color.fromRGBO(17, 17, 17, 1)
          ])),

      // color: Color.fromRGBO(17, 17, 17, 0.2),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SnackListGridView(
            snacksList: widget.snacksList,
            onTapAddButton: (snackId) => widget.onTapAddButton(snackId),
            onTapPlusButton: (snackId) => widget.onTapPlusButton(snackId),
            onTapMinusButton: (snackId) => widget.onTapMinusButton(snackId),
          ),
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
              child: TotalAmountButtonView(
                  snacksList: widget.snacksList,
                  snackTotalAmt: widget.snackTotalAmt,
                  onTapFoodAndBeverageView: () {
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
                              child: _navigateToBottomSheet(
                                  context, widget.snacksList),
                            )
                          ]);
                        });
                  },
                  onTapGoToCheckOut: () {


                    List<SnackVO> selectedSnackListArray = [];

                    widget.snacksList.forEach((snackVO) {
                      if((snackVO.quantity??0) >= 1)
                      {
                        selectedSnackListArray.add(snackVO);

                      }


                    });


                    _navigateToCheckOutPage(
                        context,
                        widget.cinemaName ?? "",
                        widget.timeslotTime ?? "",
                        widget.dateString ?? "",
                        widget.movieDetailsObj,
                        widget.selectedSeatedVOList ?? [],
                        selectedSnackListArray,
                    widget.theaterShowTimeslotId);
                        //widget.snacksList);
                  },
                  isBottomSheetView: false),
            ),
          )
        ],
      ),
    );
  }
}

class SnackListGridView extends StatefulWidget {
  Function(int) onTapAddButton;
  List<SnackVO> snacksList;
  Function(int) onTapPlusButton;
  Function(int) onTapMinusButton;

  SnackListGridView(
      {Key? key,
      required this.snacksList,
      required this.onTapAddButton,
      required this.onTapPlusButton,
      required this.onTapMinusButton})
      : super(key: key);

  @override
  State<SnackListGridView> createState() => _SnackListGridViewState();
}

class _SnackListGridViewState extends State<SnackListGridView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //  color: Colors.black87,
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
            return SnackListItemView(
              snackVO: widget.snacksList[index],
              onTapAddButton: (snackId) => widget.onTapAddButton(snackId),
              onTapPlusButton: (snackId) => widget.onTapPlusButton(snackId),
              onTapMinusButton: (snackId) => widget.onTapMinusButton(snackId),
            );
          },
          itemCount: this.widget.snacksList.length,
          // n
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}

BottomSheetView _navigateToBottomSheet(
    BuildContext context, List<SnackVO> snacksList) {
  return BottomSheetView(snackList: snacksList);
}

Future<dynamic> _navigateToCheckOutPage(
    BuildContext context,
    String cinemaName,
    String timeslotTime,
    String dateString,
    MovieVO? movieDetailsObj,
    List<SeatVO> selectedSeatedVOList,
    List<SnackVO> snackVOList, int theaterShowTimeslotId) {
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CheckOutPage(
        cinemaName: cinemaName,
        timeslotTime: timeslotTime,
        dateString: dateString,
        movieDetailsObj: movieDetailsObj,
        selectedSeatedVOList: selectedSeatedVOList,
        selectedSnackVOList: snackVOList,
          theaterShowTimeslotId: theaterShowTimeslotId
      ),
    ),
  );
}
