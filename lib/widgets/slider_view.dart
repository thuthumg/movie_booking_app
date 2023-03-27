import 'package:flutter/material.dart';
import 'package:movie_booking_app/resources/dimens.dart';

class SliderView extends StatefulWidget {
  double sliderValue;
  TransformationController transformationController;

  SliderView(
      {required this.sliderValue, required this.transformationController});

  @override
  SliderWidgetState createState() => new SliderWidgetState(
      sliderValue: sliderValue,
      transformationController: transformationController);
}

class SliderWidgetState extends State {
  TransformationController transformationController;
  double sliderValue;
  int _value = 1;

  SliderWidgetState(
      {required this.sliderValue, required this.transformationController});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (sliderValue > 1.0) {
                sliderValue -= 1;
                print("LNV>>> $sliderValue");
                transformationController.value = Matrix4.identity()
                  ..scale(sliderValue);
              }
            });
          },
          child: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        //Slider
        Center(
            child: Column(children: [
              Container(
                height: 5,
                margin: EdgeInsets.only(top: MARGIN_MEDIUM_3),
                child: Slider(
                    value: sliderValue.toDouble(),
                    min: 0.0,
                    max: 5.0,
                    divisions: 5,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white54,
                    label: 'Set screen zoom',
                    onChanged: (double newValue) {
                      setState(() {
                        _value = newValue.round();
                        if (_value.toDouble() >= 1.0) {
                          sliderValue = _value.toDouble();
                          print("NV>>> $sliderValue");
                          transformationController.value = Matrix4.identity()
                            ..scale(sliderValue);
                        }
                      });
                    },
                    semanticFormatterCallback: (double newValue) {
                      return '${newValue.round()} dollars';
                    }),
              ),
              // Container(
              //   height: 5,
              //     margin: EdgeInsets.only(top: MARGIN_MEDIUM_3),
              //     child: Slider(
              //         value: sliderValue,//valueHolder.toDouble()
              //         min: 0.0,
              //         max: 5.0,
              //       //  divisions: 10,
              //         activeColor: Colors.white,
              //         inactiveColor: Colors.grey,
              //         label: '${sliderValue.round()}',
              //         onChanged: (double newValue) {
              //           setState(() {
              //             print("CV>> $sliderValue");
              //             // transformationController.value = Matrix4.identity()
              //             //   ..scale(sliderValue);
              //           });
              //         },
              //         semanticFormatterCallback: (double newValue) {
              //           return '${newValue.round()}';
              //         }
              //     ),),
              Text(
                '', style: TextStyle(fontSize: 22), //$valueHolder
              )
            ])),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (sliderValue < 5.0) {
                sliderValue += 1;
                print("RNV>>> $sliderValue");
                transformationController.value = Matrix4.identity()
                  ..scale(sliderValue);
              }
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
