import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';
class PriceRangeSlider extends StatefulWidget {
  @override
  _PriceRangeSliderState createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  double _minValue = 3500;
  double _maxValue = 20000;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text('3500Ks',style: TextStyle(
                color: Color.fromRGBO(136, 136, 136, 1),
                fontSize: TEXT_REGULAR_1X,
                fontWeight: FontWeight.w500
            ),),
            Spacer(),
            Text('29500Ks',style: TextStyle(
                color: Color.fromRGBO(136, 136, 136, 1),
                fontSize: TEXT_REGULAR_1X,
                fontWeight: FontWeight.w500
            ),),
          ],
        ),
        RangeSlider(
          values: RangeValues(_minValue, _maxValue),
          /*min: 0,
          max: 50000,*/
          min: 3500,
          max: 29500,
          onChanged: (RangeValues values) {
            setState(() {
              _minValue = values.start;
              _maxValue = values.end;
            });
          },
          divisions: 500,
          labels: RangeLabels(
            _minValue.toInt().toString(),
            _maxValue.toInt().toString(),
          ),
          activeColor: SECONDARY_COLOR,
          inactiveColor: Color.fromRGBO(136, 136, 136, 1),
        ),
      ],
    );
  }
}
// class PriceRangeSlider extends StatefulWidget {
//   @override
//   _PriceRangeSliderState createState() => _PriceRangeSliderState();
// }
//
// class _PriceRangeSliderState extends State<PriceRangeSlider> {
//   RangeValues _values = RangeValues(100.0, 10000.0);
//   final NumberFormat _currencyFormatter =
//   NumberFormat.currency(symbol: '\$', decimalDigits: 0);
//
//   @override
//   Widget build(BuildContext context) {
//     return RangeSlider(
//       values: _values,
//       min: 0.0,
//       max: 10000.0,
//       onChanged: (RangeValues newValues) {
//         setState(() {
//           _values = newValues;
//         });
//       },
//       labels: RangeLabels(
//         _currencyFormatter.format(_values.start),
//         _currencyFormatter.format(_values.end),
//       ),
//       divisions: 10,
//       activeColor: Colors.blue,
//       inactiveColor: Colors.grey,
//       thumbColor: Colors.blue,
//       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
//     );
//   }
// }