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

  @override
  Widget build(BuildContext context) {

 //   _selectedItem = filterArrayObj[0].toString();
    String _selectedItem = filterArrayObj[0].toString();
    final List<String> _ItemName = filterArrayObj;

    return Container(
      margin: const EdgeInsets.only(top: 8.0, right: 8.0),
      width: 200,
      // color: Colors.white,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 2.0,
            bottom: 2.0
          ),
          enabledBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          ),
          border: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        dropdownColor: Colors.white,
        value: _selectedItem,
        onChanged: (newValue) {
          setState(() {
            _selectedItem = newValue ?? "";
          });
        },
        items: _ItemName.map((countryCode) {
          return DropdownMenuItem<String>(
            value: countryCode,
            child: Text(
              countryCode,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          );
        }).toList(),
        // items: dropdownItems
      ),
    );

  }
}
