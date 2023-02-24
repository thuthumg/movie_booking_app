import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_booking_app/resources/colors.dart';
import 'package:movie_booking_app/resources/dimens.dart';

// class TimeRangeSlider extends StatefulWidget {
//   final ValueChanged<TimeOfDay> onStartTimeSelected;
//   final ValueChanged<TimeOfDay> onEndTimeSelected;
//
//   TimeRangeSlider({required this.onStartTimeSelected, required this.onEndTimeSelected});
//
//   @override
//   _TimeRangeSliderState createState() => _TimeRangeSliderState();
// }
//
// class _TimeRangeSliderState extends State<TimeRangeSlider> {
//   double _startValue = 0.0;
//   double _endValue = 1.0;
//
//   double _minValue = 0.0;
//   double _maxValue = 1.0;
//
//   double _valueToTime(double value) {
//     return value * 4 + 8;
//   }
//
//   double _timeToValue(double time) {
//     return (time - 8) / 4;
//   }
//
//   TimeOfDay _valueToTimeOfDay(double value) {
//     int hours = _valueToTime(value).floor();
//     int minutes = ((_valueToTime(value) - hours) * 60).round();
//     return TimeOfDay(hour: hours, minute: minutes);
//   }
//
//   double _timeOfDayToValue(TimeOfDay time) {
//     return _timeToValue(time.hour.toDouble() + time.minute.toDouble() / 60);
//   }
//
//   void _onStartChanged(double value) {
//     setState(() {
//       _startValue = value;
//       if (widget.onStartTimeSelected != null) {
//         widget.onStartTimeSelected(_valueToTimeOfDay(value));
//       }
//     });
//   }
//
//   void _onEndChanged(double value) {
//     setState(() {
//       _endValue = value;
//       if (widget.onEndTimeSelected != null) {
//         widget.onEndTimeSelected(_valueToTimeOfDay(value));
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               DateFormat.jm().format(
//                   DateTime(2000, 1, 1, _valueToTime(_startValue), 0)),
//               style: TextStyle(fontSize: 16),
//             ),
//             Text(
//               DateFormat.jm()
//                   .format(DateTime(2000, 1, 1, _valueToTime(_endValue), 0)),
//               style: TextStyle(fontSize: 16),
//             ),
//           ],
//         ),
//         SizedBox(height: 16),
//         RangeSlider(
//           values: RangeValues(_startValue, _endValue),
//           min: _minValue,
//           max: _maxValue,
//           onChanged: (RangeValues values) {
//             _onStartChanged(values.start);
//             _onEndChanged(values.end);
//           },
//           divisions: 12,
//           labels: RangeLabels(
//             DateFormat.jm().format(
//                 DateTime(2000, 1, 1, _valueToTime(_startValue), 0)),
//             DateFormat.jm()
//                 .format(DateTime(2000, 1, 1, _valueToTime(_endValue), 0)),
//           ),
//         ),
//         SizedBox(height: 16),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('8am'),
//             Text('12pm'),
//           ],
//         ),
//       ],
//     );
//   }
// }

class TimeRangeSliderExample extends StatefulWidget {
  @override
  _TimeRangeSliderExampleState createState() => _TimeRangeSliderExampleState();
}

class _TimeRangeSliderExampleState extends State<TimeRangeSliderExample> {
  DateTime _minTime = DateTime.now().subtract(Duration(hours: 2));
  DateTime _maxTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text('Min Time: ${DateFormat('h:mm a').format(_minTime)}'),
          // Text('Max Time: ${DateFormat('h:mm a').format(_maxTime)}'),
          // SizedBox(height: 16.0),
          RangeSlider(
            values: RangeValues(
              _minTime.millisecondsSinceEpoch.toDouble(),
              _maxTime.millisecondsSinceEpoch.toDouble(),
            ),
            min: DateTime.now().subtract(Duration(hours: 24)).millisecondsSinceEpoch.toDouble(),
            max: DateTime.now().millisecondsSinceEpoch.toDouble(),
            onChanged: (RangeValues values) {
              setState(() {
                _minTime = DateTime.fromMillisecondsSinceEpoch(values.start.toInt());
                _maxTime = DateTime.fromMillisecondsSinceEpoch(values.end.toInt());
              });
            },
            divisions: 48,
            labels: RangeLabels(
              DateFormat('h:mm a').format(_minTime),
              DateFormat('h:mm a').format(_maxTime),
            ),
            activeColor: SECONDARY_COLOR,
            inactiveColor: Color.fromRGBO(136, 136, 136, 1),
          ),
        ],
      ),
    );
  }
}


/*

class TimeRangeSlider extends StatefulWidget {
  @override
  _TimeRangeSliderState createState() => _TimeRangeSliderState();
}

class _TimeRangeSliderState extends State<TimeRangeSlider> {
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
          */
/*min: 0,
          max: 50000,*//*

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
}*/
