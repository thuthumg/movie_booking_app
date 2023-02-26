import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/filter_obj.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:movie_booking_app/constants/filter_obj.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
import 'package:movie_booking_app/resources/strings.dart';

class FilterDropdownView extends StatefulWidget {
  List<String> filterArrayObj;

  FilterDropdownView(this.filterArrayObj);

  @override
  _FilterDropdownState createState() => _FilterDropdownState(filterArrayObj);
}

class _FilterDropdownState extends State<FilterDropdownView> {
  List<String> filterArrayObj = [];

  _FilterDropdownState(this.filterArrayObj);
  String _selectedItem = "";
  @override
  Widget build(BuildContext context) {
    //   _selectedItem = filterArrayObj[0].toString();
    _selectedItem = _selectedItem.isEmpty? filterArrayObj[0].toString() : _selectedItem;
    final List<String> _ItemName = filterArrayObj;

    // return Container(
    //   margin: const EdgeInsets.only(top: 5.0, right: 5.0),
    //   constraints: BoxConstraints(
    //     minHeight: 5.0,
    //     minWidth: 70.0,
    //     maxHeight: 30.0,
    //     maxWidth: 200.0,
    //   ),
    //   // color: Colors.white,
    //   child: DropdownButtonFormField(
    //     borderRadius: BorderRadius.circular(10),
    //     decoration: InputDecoration(
    //       contentPadding:
    //           EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
    //       enabledBorder: OutlineInputBorder(
    //         // borderSide: BorderSide(color: Colors.white, width: 2),
    //         borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
    //       ),
    //       border: OutlineInputBorder(
    //         // borderSide: BorderSide(color: Colors.white, width: 2),
    //         borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
    //       ),
    //       filled: true,
    //       fillColor: Colors.white,
    //     ),
    //     dropdownColor: Colors.white,
    //     value: _selectedItem,
    //     onChanged: (newValue) {
    //       setState(() {
    //         _selectedItem = newValue ?? "";
    //       });
    //     },
    //     items: _ItemName.map((countryCode) {
    //       return DropdownMenuItem<String>(
    //         value: countryCode,
    //         child: Text(
    //           countryCode,
    //           style: const TextStyle(
    //               color: Colors.black,
    //               fontSize: 16,
    //               fontWeight: FontWeight.w400),
    //         ),
    //       );
    //     }).toList(),
    //     // items: dropdownItems
    //   ),
    // );

    return Container(
       margin: const EdgeInsets.only(top: 10.0, right: 10.0),
      constraints: BoxConstraints(
        minHeight: 5.0,
        minWidth: 70.0,
        maxHeight: 30.0,
        maxWidth: 200.0,
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),

      // decoration:
      //     BoxDecoration(border: Border.all(color: Colors.white70, width: 1)),
      // width: double.infinity,
      // margin: const EdgeInsets.all(5),
      child: DropdownButtonHideUnderline(
        //     decoration: InputDecoration(
        //       contentPadding:
        //           EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
        //       enabledBorder: OutlineInputBorder(
        //         // borderSide: BorderSide(color: Colors.white, width: 2),
        //         borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        //       ),
        //       border: OutlineInputBorder(
        //         // borderSide: BorderSide(color: Colors.white, width: 2),
        //         borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        //       ),
        //       filled: true,
        //       fillColor: Colors.white,
        //     ),
        child: ButtonTheme(
          minWidth: 100,
          height: 70,
          alignedDropdown: true,
          child: DropdownButton(
            // dropdownColor: Colors.white70,
            iconSize: 20,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.black,
            ),
            value: _selectedItem,
            items: _ItemName.map((countryCode) {
              return DropdownMenuItem<String>(
                value: countryCode,
                child: Text(
                  countryCode,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedItem = newValue ?? "";
              });
            },
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}

// class FilterDropdownView extends StatefulWidget {
//
//   List<String> filterArrayObj;
//
//   FilterDropdownView(this.filterArrayObj);
//
//   @override
//   _FilterDropdownState createState() => _FilterDropdownState(filterArrayObj);
// }
//
// class _FilterDropdownState extends State<FilterDropdownView> {
//
//   List<String> filterArrayObj = [];
//
//   _FilterDropdownState(this.filterArrayObj);
//
//   String _selectedItem = "";
//   @override
//   Widget build(BuildContext context) {
//
//     _selectedItem = _selectedItem.isEmpty? filterArrayObj[0].toString() : _selectedItem;
//
//     final List<String> _ItemName = filterArrayObj;
//
//     return IntrinsicWidth(
//       child: Container(
//        // padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         margin: const EdgeInsets.only(top: 8.0, right: 8.0),
//         height: 35,
//        // padding: EdgeInsets.zero,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(MARGIN_MEDIUM)
//         ),
//         // width: MediaQuery.of(context).size.width,
//         // color: Colors.white,
//         child:
//         DropdownButton<String>(
//           underline: Container(),
//           value: _selectedItem,
//           dropdownColor: Colors.white,
//           icon: const Padding(
//             padding: EdgeInsets.only(right: MARGIN_MEDIUM),
//             child: Icon(
//               Icons.keyboard_arrow_down_sharp,
//               color: Colors.black, // <-- SEE HERE
//             ),
//           ),
//           onChanged: (newValue) {
//             setState(() {
//               _selectedItem = newValue ?? "";
//             });
//           },
//           items: _ItemName.map((countryCode) {
//             return DropdownMenuItem<String>(
//               value: countryCode,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 0, horizontal: MARGIN_MEDIUM),
//                 child: Text(
//                   countryCode,
//                   style: const TextStyle(
//                       color: Colors.black,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),
//             );
//           }).toList(),
//         )
//
//
//
//         ,
//       ),
//     );
//
//   }
// }
